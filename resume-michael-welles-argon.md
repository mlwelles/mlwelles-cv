# Michael L. Welles
- **Address:** 5657 NY-97, Narrowsburg NY 12764
- **Phone:** 917-586-9218
- **Email:** mlwelles@gmail.com
- **Availability:** Open to New York relocation for in-person collaboration.

## Overview

Hands-on engineering leader focused on compressing the build–ship–feedback loop for safety-critical and data-intensive products. I partner closely with product and operations to set pragmatic guardrails, automate quality signals, and model the engineering culture I expect—clear communication, strong code hygiene, and accountability. Comfortable pairing strategic architecture decisions with deep dives into code, infrastructure, and tooling.

- 20+ years of experience as a principal-level engineer and engineering leader. I've worked on embedded devices, distributed systems, aerospace and defence, and AI-driven platforms.  
- The past decade split between principal, director, and head-of-technology roles.
- Firm believer that best practices and a strong SDLC is the guarantor for high-velocity delivery: lightweight planning, CI/CD gates, gitops, test  enforcement, post-incident learning, continuous tooling and process improvement are how to keep flow fast without sacrificing reliability, 
- Deep hands-on experience with Python, Rust, Go, Swift, Docker, Kubernetes, Azure, AWS.  
- Experienced in asynchronous architectures, observability, fault tolerance, and developer tooling that minimize MTTR and change failure rate in production environments.

## Experience

### Consulting Principal Engineer, CubeNexus.ai
*Sep 2025 - Present · Remote*

CubeNexus.ai builds a geospatial intelligence platform that allows the use of LLM an LLM based natural language interface to assist in the analysis of temporal-spatial datasets, interactive 3D visualizations that are continuously updated as the user refines their query.  I have been advising and helping guide the technical roadmap while also being deep in the code, migrating it from prototype to production ready. 
- Hardened the API backend with rebuilt auth and token handling, formalized  validation, and refactored code paths to greatly improve performance..
- Added support for the transmission and collection of realtime streaming telemetry data from the drones developed by the company to the backend and the front end WebGL visualizer.  Demonstrated during live flight of sensor equipped drone, the visualizer rendering its flight path and a visualization of the fields measured by its sensor array in real time. 
- Added CI/CD to all project repositories with static analysis, automated tests, build and deployment automation. 
- Rebuilt the ingestion pipeline that transforms geospatial data into the proprietary format at the core of the company IP. Rewrote code to in vectorized pandas which allows not only to be run more efficiently standalone, but more importantly, by leveraging pyspark-pandas being able to be run on Spark clusters and distribute  processing real world industry datasets across across any number of nodes that would otherwise be too large for a single machine to handle.    

### Principal Engineer, Istari Digital
*Feb 2024 - Jul 2025 · New York, NY*

Istari Digital builds a secure zero-trust and zero-knowledge digital-threading platform for automating and managing the practice of digital engineering in the aerospace and defense space. I acted as software architect and technical lead for rewrite of their core platform, balancing strict compliance with security requirements with the ability to deliver rapid iteration and rapid release cycles. 

- Designed cryptographically verified asset lineage that preserves dependencies, provenance, and tooling metadata without exposing sensitive payloads—enabling zero-knowledge collaboration and trustworthy automation.
- Implemented DoD-compliant control tagging that enforces data sovereignty, provides auditable sharing, and keeps cross-organization workflows lightweight.
- Delivered all major program milestones on time, relaunching the platform for both commercial and government clients.
- Rebuild the core registry service (FastAPI, SQLAlchemy, Postgres) and the client SDKs for interacting of it. The cyptographic core of the SDK was written in Rust, exporting Python and WebAssembly bindings wrapped by the Python and TypeScript SDKs used by both internal and client development teams to build applications for the platform. 
- Added CI/CD to all project repositories with static analysis, automated tests, and versioned builds.  Ensured that the build automation validated that all compliance requirements were met and published with each release the documentary evidence of such for required for review in order receive ATO approval for deployment on secure and classified networks. 
- Automated the setup, configuration, and deployments all environments following GitOps best practices, combination of Terraform, Github Actions, and ArgoCD.  

### Director of Software Development, Raytheon Technologies
*Sep 2021 - Nov 2023 · New York, NY*

Rejoined the UTC Digital Accelerator (EDX) to build next-generation telemetry platforms for Pratt & Whitney aircraft engines—compressing ingestion-to-alert loops under strict reliability requirements.

- Architected and built streaming telemetry pipelines that moved multi-aircraft sensor payloads from gate upload through Spark-based analytics in minutes, enabling predictive maintenance decisions ()
- Instituted processes and practices to ensure auditability and lineage of data ingested and transformed by the pipelines, and the and ML model versions trained from them, access enforcement, observability dashboards with reproducible training workflows. (Databricks, Immuta)
- Adopted "inner source" model for code re-use, partnering with global compliance so that a github approval from a authorized maintainer created the necessary and was legally considered formal EAR-99 classification and clearance for internal reuse.  
- Developed and published a number of software packages to address shared problems faced by development teams across different business units:  SDKs for working with proprietry engine data telemetry formats, quickstart kits for Databricks data ingestion and ML training projects,  tools to assist in synthetic data generation,
- Spearheaded process improvements that kept agile teams lean while meeting. aerospace compliance, leading 14 engineers on contractors across three squads and coaching them on incident response, SLOs, and deployment hygiene.


### Founding Engineer, Head of Technology, Dayforward
*Jan 2020 - Sep 2021 · New York, NY*

Founding engineer and head of technology leader at a life-insurance startup. 

- Led a team of 4 engineers. 
- Built an algorithmic underwriting and policy management system in under ten months using containerized Go gRPC microservices on Kubernetes, fronted by a federated GraphQL API and a frontend app coded in Vue.js.
- Terraform-managed AWS infrastructure with CI/CD, blue/green deploys, and instrumentation for customer onboarding flows and underwriting decisions.
- Balanced rapid iteration with security and compliance reviews demanded by regulators, aligning engineering and operations on release readiness.

### Director of Software Engineering, UTC Aerospace Systems
*Feb 2019 - Jan 2020 · Brooklyn, NY*

Oversaw 17 engineers across IoT, data, and frontend teams at the UTC Digital Accelerator. Standardized engineering practices, developer tooling, and design systems while delivering modernized refrigeration telemetry and industrial apps.

### Independent Contractor, Barking For Centuries, LLC
*Jan 2018 - Feb 2019 · New York, NY*

Chief technologist for a vertical product search startup.

- Built Python-based ETL pipelines with custom ML classification, spaCy/NLTK NLP, and AWS SageMaker computer vision models.
- Designed event-driven ingestion with DynamoDB, AWS SQS/SNS, and Dockerized microservices deployed to Kubernetes via Terraform, ensuring replayable, idempotent workflows.
- Delivered the search API in Go backed by Elasticsearch and React.js frontends tailored to rapid merchandising experiments.

### Director of Engineering (Mobile), MediData
*Feb 2017 - Jan 2018 · New York, NY*

Led Patient Cloud mobile engineering teams collecting clinical-trial data from patients and clinicians.

- Migrated native development to Swift and Kotlin, launched two major product initiatives, and introduced real-time stream processing (Apache Flink) for sensor ingestion.
- Improved team velocity by 2.5× through lightweight planning cadences, instrumentation, and automated test gates.

### Principal Architect / Director of Mobile, Huge
*May 2013 - Feb 2017 · Brooklyn, NY*

- Directed cross-functional teams of 20+ engineers, QA, designers, and PMs delivering high-traffic mobile and backend systems with CI/CD and rapid release cycles.
- Led efforts to advance the engineering culture at the company: Helped institute a global guild system for the engineering disciplines at the company encourage knowledge sharing across project silos and geographic boundries. 
- Established a process for engineers to propose and receive formal sponsorship for R&D project initiatives. One of which became the prototype at the core of an ambitious client project propose, and after being demonstrated at the pitch meeting, was repsonsible for landing the contract and the ~$10m in revinue that resulted. 
- Established a company engineering blog, updated on a regular bases with technical deep dives on a wide array topics authored by engineers from across the company global org.    
- rganized weekly cross discipline tech breakfasts.  
- Sponsored R&D initiatives in emerging interfaces and spearheaded internal engineering culture programs, including blog, meetups, and open-source efforts.

### Manager of Mobile Technology, Consumer Reports
*Jul 2011 - May 2013 · Yonkers, NY*

Founded the mobile applications group, designed and built flagship ratings apps while managing vendors maintaining legacy portfolios.

### Senior Software Engineer – iTunes Store Video Workflow Group, Apple
*Mar 2008 - May 2011 · Cupertino, CA*

Engineer on the five-person core team encoding all iTunes video media. Owned the distributed encoding toolchain, release validation suites, and reference media, leading two major workflow rewrites (HDTV launch and international expansion).

### Senior Software Architect, The New York Times
*Aug 2007 - Mar 2008 · New York, NY*

Led adoption of continuous integration, automated packaging, and deployment tooling for NYTimes.com’s content management overhaul.

### Founder, Partner, Bangstate
*Jun 1999 - Mar 2008 · New York, NY*

Co-founded a 15-person consultancy delivering large-scale content distribution systems for clients including Associated Press, Atlantic Records, Forbes, and Time Inc.

### Senior Software Developer, The Associated Press
*Jun 2003 - Sep 2006 · New York, NY*

Built high-traffic multimedia distribution systems, including the AP Hosted Elections platform serving real-time 2004 U.S. election results to every major newsroom.

## Technical Strengths

- **Languages:** Python, Go, TypeScript/Node.js, Rust (FFI), Kotlin, Swift, SQL.
- **Platforms:** AWS (S3, SQS/SNS, Lambda, IAM, Cognito), Kubernetes, Docker, Terraform, GitHub Actions, Databricks/Spark.
- **Practices:** SDLC metrics (lead time, MTTR, change failure rate), CI/CD, observability (tracing, logging, metrics), SLO/SLA definition, incident response, secure development lifecycle.
- **Data:** PostgreSQL, DynamoDB, Elasticsearch, Pandas, feature pipelines, model governance.

## Leadership & Culture

- Coach teams on direct, kind feedback loops and lightweight cadences that preserve velocity.
- Build mentorship programs, onboarding guides, and architecture reviews that keep distributed teams aligned.
- Partner with product, design, and operations to co-own roadmaps, customer outcomes, and risk management.

## Education

### Bachelor of Arts in History, The University of Chicago
*Chicago, IL*
