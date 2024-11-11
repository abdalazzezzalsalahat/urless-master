# Linux Questions:
### 1. What is the purpose of /dev/null , and how would you use it in a script?
**It redirects unwanted output** 
`command  /dev/null 2>&1`

### 2. How does the nice and renice command work, and why might you use them?
**They adjanst the process prirority**
`nice -n 10 command`
`renice 15 -p PID`

### 3. If a Linux server is running slowly, how would you troubleshoot it?
**Using commands like `top, htop, vmstat, iostat`**

### 4. How would you determine the number of CPU cores on a Linux system?
**Using commands like `lscpu, nproc`**


---
---

# AWS Questions: 
### 1. What is the purpose of AWS Lambda cold start, and how would you reduce its impact?
**The initial startup time for a Lambda function, during which the runtime environment is provisioned.**
**Impact will be reduced with: *Provisioned concurrency, Warmup functions, Leverage container images***

### 2. How does AWS Elastic Load Balancer support high availability, and what is the difference between ALB, NLB, and CLB?
**The ELB provids High availability by  Distributing incoming traffic across multiple targets, ensuring fault tolerance.**

#### ALB vs NLB vs CLB:
**ALB (Application Load Balancer):** Advanced routing, supports HTTP/2, WebSocket, and offers features like sticky sessions and path-based routing.
**NLB (Network Load Balancer):** Low latency, supports TCP, UDP, and TLS termination.
**CLB (Classic Load Balancer):** Older generation, supports HTTP and HTTPS.

### 3. How would you securely store and manage API keys for an application hosted on EC2 instances?
**There are many ways to secure API keys:**
1. AWS secrets manager
2. IAM roles
3. Environment variables
4. Configuration management tools

### 4. How would you troubleshoot a scenario where an EC2 instance cannot access the internet?
**To check an EC2 connection with the internet, I will check the *Security group rules* first, then the *Network interface configuration*, after that will check the *system status and network interface*, then with go check on the *Gateway*, *Rout tables*, *firewall rules*, and lastly will be the *DNS resolution***




