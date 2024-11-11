#!/bin/bash

# Define the Git repository path
REPO_PATH="/root/HW/urless-master"

cd "$REPO_PATH" || exit 1

tag_deployment() {
    TAG_NAME="deployment-$(date +%Y%m%d%H%M%S)"
    
    git tag "$TAG_NAME"
    echo "Created new deployment tag: $TAG_NAME"
    
    git push origin "$TAG_NAME"
    
    prune_old_tags
}

prune_old_tags() {
    TAGS=$(git tag -l "deployment-*" --sort=-creatordate)
    
    TAG_COUNT=$(echo "$TAGS" | wc -l)
    
    if [ "$TAG_COUNT" -gt 4 ]; then
        TAGS_TO_DELETE=$(echo "$TAGS" | tail -n +5)
        
        for TAG in $TAGS_TO_DELETE; do
            git tag -d "$TAG"
            git push origin --delete "$TAG"
            echo "Deleted old deployment tag: $TAG"
        done
    fi
}

rollback() {
    echo "Available rollback points:"
    git tag -l "deployment-*" --sort=-creatordate | head -n 4
    
    echo "Enter the tag you want to rollback to:"
    read -r ROLLBACK_TAG
    
    if git rev-parse "$ROLLBACK_TAG" >/dev/null 2>&1; then
        git checkout "$ROLLBACK_TAG"
        echo "Rolled back to $ROLLBACK_TAG"
    else
        echo "Error: Tag $ROLLBACK_TAG does not exist."
    fi
}

case "$1" in
    deploy)
        tag_deployment
        ;;
    rollback)
        rollback
        ;;
    *)
        echo "Usage: $0 {deploy|rollback}"
        exit 1
        ;;
esac

