# Michael L. Welles
- **Address:** 38 Covert St, Brooklyn NY 11207
- **Phone:** 917-586-9218
- **Email:** mlwelles@gmail.com

## Overview

Hands-on engineering leader with decades of experience building safety-critical and data-intensive products at high velocity. Proven track record accelerating engineering teams (achieved 2.5× velocity increase at MediData) while maintaining code quality through pragmatic CI/CD, observability, and disciplined SDLC practices. I partner closely with product and operations to compress the build-ship-iterate loop, set pragmatic guardrails, automate quality signals, and model the engineering culture I expect—clear communication, strong code hygiene, and accountability. Comfortable pairing strategic architecture decisions with deep dives into code, infrastructure, and tooling.

## Core Technologies

**Languages & Frameworks:** Python, Rust, Go, Typescript, Swift, Objective-C, Kotlin, Java 
**Data & Databases:** Databricks, Spark, PostgreSQL, DynamoDB, Elasticsearch
**Cloud & Infrastructure:** Kubernetes, Docker, AWS (SQS/SNS, S3, IAM, VPC, SageMaker), Azure, Terraform
**Reliability & Observability:** CI/CD, distributed tracing, metrics/logging, SLOs/alerting, incident response
**Async Patterns:** Message queues, pub/sub, event-driven architecture, concurrency, idempotency, retry/backoff

## Experience

### Consulting Principal Engineer, CubeNexus.ai
*Aug 2025 - Present · Remote*

CubeNexus.ai builds a geospatial intelligence platform that pairs an LLM-based natural language interface for querying temporal-spatial datasets with a dynamic and interactive 3D data visualizer. I've been advising technical strategy across ingestion, analytics, and user experience, while diving deep in the codebase to bring it from prototype to production ready.

- Added real-time telemetry streaming to the platform for live drone flights using event-driven architecture (Ably pub/sub messaging). Integrated asynchronous data flow from drone controller through backend to frontend WebGL visualizer, enabling real-time visualization of flight paths and sensor readings during live operations. Successfully demonstrated concurrent processing of multiple telemetry streams without blocking.
- Rewrote the ingestion pipeline to transform geospatial datasets into the proprietary format at the core of the company IP. Previous implementation failed on datasets over 200MB; new pipeline handles multi-terabyte datasets required by industry (PySpark, Pandas, distributed computing).
- Hardened the API backend (Python/FastAPI) with rebuilt authentication and token handling, formalized validation, and refactored code paths for clarity and performance. Implemented proper error handling, idempotency keys, and retry logic for reliability.
- Established CI/CD across all repositories with static analysis, automated tests, build, and deployment automation.

### Principal Engineer, Istari Digital
*Feb 2024 - Jul 2025 · New York, NY*

Istari Digital focuses on interconnected digital systems where secure, shareable digital threads facilitate the development of cyber‑physical systems. The platform enables zero‑trust, zero‑knowledge security while connecting and enabling the automation of tools as Cameo, CATIA, Nastran, OpenFOAM and other computational modeling suites to accelerate digital‑twin development and facilitate secure collaboration.

- Designed cryptographically verified asset lineage that preserves dependencies, provenance, and tooling metadata without exposing sensitive payloads—enabling zero-knowledge collaboration and trustworthy automation.
- Implemented DoD‑compliant control tagging to ensure customers retain data sovereignty. This provided strict controls and audit trails while enabling frictionless sharing of models and artifacts among individual engineers, teams and organizations.
- Led team building secure backend registry service (Python, FastAPI, SQLAlchemy, PostgreSQL, Zanzibar, Authzed) and the SDK for it. Designed database schema for asset relationships and metadata, tuned queries for complex lineage traversal, and managed migrations for zero-downtime deployments. The cryptographic core of the SDK was written in Rust, with bindings exported for Python and WebAssembly. These were wrapped by the Python and TypeScript SDKs used by internal and client developers to build automation agents and the frontend web application.
- Ensured that the CI/CD build automation validated that all compliance requirements were met on each release, and the results published in a format suitable for submission for compliance review to minimize the effort and time spent for each to receive ATO approval for deployment on secure and classified networks.
- Delivered all major program milestones on time and successfully relaunched the product for commercial and government clients.

### Director of Software Development, Raytheon Technologies
*Sep 2021 - Nov 2023 · New York, NY*

Rejoined what was formerly the UTC Digital Accelerator (DX)—reorganized post‑merger as Enterprise Data Services (EDX)—to build a next‑generation data platform for Raytheon aerospace applications.

- Technical lead for pathfinder initiatives building real-time flight telemetry pipelines for multiple models of Pratt & Whitney commercial jet engines. Built streaming data platform where sensor data from thousands of engine sensors was both evaluated fault detection algorithms and scored by multiple failure prediction and anomaly detection models (SparkML, scikit-learn).
- Designed pipeline for AI model training and orchestration: parallel evaluation of multiple ML models without adding latency, using asynchronous patterns and concurrent processing. 
- Faults detected by any of these processes attached to the stream could trigger automated alerts with responses proportional to severity and confidence—from grounding aircraft for emergency maintenance to scheduling inspection or simply flagging for manual review.
- Built comprehensive model evaluation framework with audit trails tracing every output field back to specific code revisions or model versions, enabling reproducibility. Managed model-training workflows with rigorous versioning; captured code revisions, training datasets, snapshots and hyperparameters.
- Technologies included Databricks, Spark, Python, SparkML, scikit‑learn and Pandas.
- Led effort to "inner-source" code to address common problems faced by development teams at the company: SDKs for parsing proprietary engine data formats, quickstart kits for Databricks projects, synthetic data generators, etc.
- Led a team of 14 developers and contractors split across three agile project teams.
- Supervised creation of onboarding resources for more than 40 teams, publishing guidelines, standards, best practices and reference project templates.
- Assisted and advised external teams in migrating their existing data pipelines and data science projects from legacy infrastructure to the new Databricks platform.

### Head of Technology, Dayforward
*Jan 2020 - Sep 2021 · New York, NY*

Head of technology and development lead for a life‑insurance startup. Led a small team that designed and built the company’s algorithmic underwriting and policy‑management platform. The platform comprised containerized Go gRPC microservices deployed on Kubernetes and exposed via a federated GraphQL API to a Vue.js frontend. Initial development was completed in under ten months, and the platform launched the same day the company received regulatory approval.

### Director of Software Engineering, UTC Aerospace Systems
*Feb 2019 - Jan 2020 · Brooklyn, NY*

Managed a team of 17 engineers at the UTC Digital Accelerator in Brooklyn. Oversaw multiple project teams—from IoT sensors and mobile apps for industrial refrigeration to standardized design systems and developer tools. As the frontend engineering director, led efforts to normalize, document and evangelize engineering processes, standards and best practices.

### Lead Engineer / Chief Technologist, Riverdrop
*Jan 2018 - Feb 2019 · New York, NY*

Served as chief technologist for an early‑stage startup and led a team of three senior engineers to build a specialized product search engine for a specific vertical market.

- Designed and implemented an ETL pipeline built around custom machine‑learning infrastructure for product identification and extraction. The pipeline was written in Python with NLP components using spaCy for classification and entity extraction, along with NLTK and scikit‑learn.
- Developed product image recognition and classification models on AWS SageMaker, with preprocessing and color analysis using OpenCV and scikit‑image.
- Built asynchronous data flow using AWS SQS/SNS for message queuing and event-driven processing, with DynamoDB for metadata storage. Implemented retry logic, dead-letter queues, and idempotency for reliable processing.
- Built the search API in Go against Elasticsearch indexes and developed the web frontend in React.js with TypeScript.
- Architected the system as microservices and discrete transformation steps, each packaged as a Docker image and deployed via CI/CD to a Kubernetes cluster that automatically scaled both pods and worker nodes. The cluster itself was built and managed with Terraform.

### Director of Engineering (Mobile), MediData
*Feb 2017 - Jan 2018 · New York, NY*

Led engineering teams responsible for the Patient Cloud platform, which collects clinical trial data directly from patients and clinicians via mobile devices and wearable sensors.

- Managed products including ePRO (iOS and Android app for patient‑reported outcomes), Patient Cloud (iOS tablet app for clinician‑reported outcomes), AppConnect (native SDK for third‑party developers), Sensor Link (platform for ingesting data from wearables) and the supporting backend.
- Launched two major mobile product initiatives and migrated all native development to Swift and Kotlin.
- Built compliance dashboards for data reporting and initiated migration of data collection and analysis to a scalable real‑time stream‑processing framework (Apache Flink).
- Instituted organizational and process improvements that increased average team velocity by 2.5×.

### Principal Architect / Director of Mobile, Huge
*May 2013 - Feb 2017 · Brooklyn, NY*

Started as Principal Architect and was later promoted to Director of Mobile.

- Led a cross‑functional team of more than 20 iOS, Android and backend engineers, QA analysts, designers and product managers. Evangelized agile best practices, continuous integration and continuous delivery.
- As Principal Architect, sponsored new technology investigations and initiatives such as interior way‑finding, Leap Motion, Arduino and embedded system prototypes, and championed internal outreach through an engineering blog, meetups and open‑source efforts.
- Directed notable client projects including smart Bluetooth audio/video accessories supporting live video streaming and voice commands, a companion application for an AAA game publisher that scanned players’ likenesses into avatars, and numerous B2B and B2C mobile commerce applications.

### Manager of Mobile Technology, Consumer Reports
*Jul 2011 - May 2013 · Yonkers, NY*

Founded the mobile applications and new media group and built an in‑house team responsible for mobile application development.  Developed and launched the flagship ratings application and managed external vendors maintaining a portfolio of legacy apps.

### Senior Software Engineer – iTunes Store Video Workflow Group, Apple
*Mar 2008 - May 2011 · Cupertino, CA*

Senior engineer on a team of five responsible for encoding and assembling all iTunes video media. Owned the encoding toolchain used by the processing cluster and specified deliverable media formats, developed test suites for their validation and created reference media for hardware compliance testing. Led two major rewrites of the video workflow: one for the HDTV launch and another for international video and television.

### Senior Software Architect, The New York Times
*Aug 2007 - Mar 2008 · New York, NY*

 Created tools for managing releases and production deployment.  production.  Oversaw offshore CMS development. 

### Founder, Partner, Bangstate
*Jun 1999 - Mar 2008 · New York, NY*

Founded and managed a small five person development consultancy. Oversaw the business and delivered projects for clients including The Associated Press, American Bar Association, Atlantic Records, Forbes Magazine, CIR/SEIU and Time Inc.

## Education

### Bachelor of Arts in History, The University of Chicago
*Chicago, IL*
