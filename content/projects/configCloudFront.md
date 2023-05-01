+++
title = "Config CloudFront For Static Web"
date = "2023-04-30"
url = "/projects/config-cloudfront-for-static-web"
toc = true
+++

This guide will help you configure CloudFront to serve your static website content with SSL support 🔒. This can be necessary if you need to secure your website with HTTPS. We will cover the following steps:

1. Creating an SSL certificate 📜
2. Creating a CloudFront distribution 🌏
3. Updating Route 53 records 🚦

## Prerequisites

You should have an existing S3 bucket that serves your static website files.

## Step 1: Create an SSL certificate 📜

1. Navigate to the AWS Certificate Manager (ACM) and click on "Request a certificate" ➕.
2. Select "Request a public certificate" and click "Request a certificate".
3. Enter your domain name (e.g., example.com) and any subdomains you want to cover (e.g., www.example.com) 🔗. Click "Next" ▶️.
4. Choose "DNS validation" ✅ and click "Review" 🔍.
5. Review your settings and click "Confirm and request" ⚡.
6. Follow the instructions provided by AWS to validate your domain through DNS 🌐.

## Step 2: Create a CloudFront distribution 🌏

1. Navigate to the AWS CloudFront console and click on "Create Distribution" ➕.
2. Under the "Web" section, click "Get Started" 🚀.
3. For the "Origin Domain Name," select your S3 bucket that serves your static website files 🗄️. If prompted to use the website endpoint, click on it 👍.
4. Change the "Viewer Protocol Policy" to "Redirect HTTP to HTTPS".
5. Leave the "Allowed HTTP Methods" as the default value since this is for a static website 🌐.
6. In the "Alternate Domain Names (CNAMEs)" field, add your domain name (e.g., example.com) and any subdomains you want to cover (e.g., www.example.com) 🔗. If your SSL certificate covers both, you can add both.
7. Under "SSL Certificate," select "Custom SSL Certificate" and choose the SSL certificate you created in step 1 🔒.
8. Click "Create Distribution" ✅.

## Step 3: Update Route 53 records 🚦

1. Navigate to the AWS Route 53 console.
2. In the "Hosted zones" section, click on the domain name you want to update 🔗.
3. Locate the existing A record for your main domain (e.g., example.com) and click "Edit" ✏️.
4. Change the "Alias" option to "Yes" and select the CloudFront distribution you created in step 2 🌐.
5. Click "Save Record Set" 💾.
6. Create a new A record for your subdomain (e.g., www.example.com) and set the "Alias" option to "Yes" 👍. Select the same CloudFront distribution created in step 2 🌐.
7. Click "Create Record Set" ✅.

Now, your static website should be served through CloudFront with SSL support 🔒. Your content will be securely delivered over HTTPS, and users will be redirected from HTTP to HTTPS automatically 💫.
