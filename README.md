# 🚀 BoostPoint WordPress Infrastructure – AWS + Terraform

> **Provisioned by:** Adedoyin Ekong  
> **Date:** April 8, 2025  
> **Fake DNS:** `wp.boostpointmedia.com`  
> **IaC Tool:** Terraform  
> **Cloud Provider:** AWS  
> **Hosting:** WordPress  
> **YouTube Walkthrough:** **[Published to YouTube](https://www.youtube.com/playlist?list=PL7KUROV69G9ExH-nnYIJxtJTZrLHK8f_o)**.🎥

---

## 🎯 Overview

This project provisions a **highly available, fully automated WordPress infrastructure** on AWS using **Terraform** with a modular and professional architecture. All infrastructure was deployed in phases with structured videos and documentation, following DevOps best practices.

The entire process has been recorded (voice-free exept the first video where I forgot to mute my mic ❌❌❌(I apologize ahead for that)), and will be published as a **professional walkthrough series on YouTube** to visually demonstrate competence, structure, debugging, and end-to-end deployment workflow.

> 💡 This repository is built for technical recruiters, DevOps engineers, and hiring managers looking to see real-world cloud automation capability.

---

## 🧱 Infrastructure Stack

| Layer         | Component                     | Tool        |
|--------------|-------------------------------|-------------|
| Networking    | VPC, Subnets, Route Tables    | Terraform   |
| Compute       | EC2 Instance + Auto Scaling   | Terraform   |
| Web Server    | Apache + PHP + WordPress      | Bash Script |
| Database      | AWS RDS (MySQL)               | Terraform   |
| Load Balancer | Application Load Balancer     | Terraform   |
| DNS           | Simulated with Fake Output    | Terraform   |
| Automation    | User Data + Base64 Templates  | Terraform   |

---

## 🛠️ Modular Provisioning Phases

This infrastructure was broken down into 6 clean Terraform modules:

1. **VPC Module** — Subnets, IGW, NAT, route tables  
2. **Security Groups Module** — EC2, ALB, and RDS rules  
3. **EC2 Module** — WordPress deployment via `user_data.sh`  
4. **RDS Module** — Private MySQL instance + subnet group  
5. **ALB Module** — DNS, target groups, listeners  
6. **Auto Scaling + Launch Template** — Stateless EC2 scaling  
7. **Route53 Output Simulation** — Fake DNS name output

---

## 📸 Image Gallery

> View complete screenshots in the `GALLERY.md` file.

- EC2 Running – Apache + WordPress  
- ALB Target Group Healthy  
- Custom Apache Landing Page  
- WordPress Homepage Connected to RDS  
- VPC + NAT Gateway Setup  
- Final Teardown Screenshot

---

## 🎞️ Videos

> 5/11 deployment steps recorded, will be **[Published to YouTube](https://www.youtube.com/playlist?list=PL7KUROV69G9ExH-nnYIJxtJTZrLHK8f_o)**.

- EC2 Setup + Provisioning  
- Apache + WordPress Installation  
- ALB + Health Check Troubleshooting  
- Auto Scaling Group Setup  
- Route 53 Output  
- Terraform Destroy  
- Variables Walkthrough  
- Final Validation  

---

## ⚙️ Error Handling & Lessons Learned

| ❌ Issue | ✅ Resolution |
|---------|--------------|
| Invalid RDS password or name attr | Used `db_name` only and passed credentials via `user_data.sh` |
| Missing variable references | Added missing declarations in `variables.tf` |
| Bad file path in Auto Scaling user_data | Used `template_file` + `base64encode()` |
| Deleted Route53 module | Recreated with new output variable |

---

## 🧯 Infrastructure Teardown

```bash
terraform destroy -auto-approve
echo "✅ Infrastructure teardown completed - AWS costs avoided!"


📂 Suggested Project Structure

boostpoint-wordpress-aws/
├── modules/
│   ├── alb/
│   ├── autoscaling/
│   ├── ec2_wordpress/
│   ├── nat_gateway/
│   ├── rds_mysql/
│   ├── route53/
│   ├── security_groups/
│   └── vpc/
├── images/
├── videos/
├── user_data.sh.tpl
├── terraform.tfvars
├── main.tf
├── variables.tf
├── outputs.tf
├── README.md
└── .gitignore



About the Author
Adedoyin Ekong
Cloud Infrastructure | DevOps | Automation Enthusiast
🔗 YouTube Series (coming soon)
📧 Available for remote/cloud DevOps roles




## 📺 Video Demonstration

> 🎥 A curated YouTube playlist is available to showcase the most critical infrastructure steps.
> The full infrastructure was provisioned in cost-saving **phases**, showing professional discipline and control.
> 📎   **[Published to YouTube](https://www.youtube.com/playlist?list=PL7KUROV69G9ExH-nnYIJxtJTZrLHK8f_o)**.
---

### ▶️ Curated Playlist

1. **Deploying WordPress on AWS EC2 with Apache**  
   _Automation via Terraform & user_data.sh_

2. **Deploying Secure MySQL RDS for WordPress**  
   _Private subnet provisioning + SG security_

3. **Final WordPress Output (EC2 + RDS)**  
   _Live infrastructure verification_

4. *(Optional)* **Teardown using Terraform Destroy**  
   _Highlights AWS cost consciousness_

---
