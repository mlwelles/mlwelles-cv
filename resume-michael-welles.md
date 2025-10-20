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

Advising on technical strategy and architecture for a geospatial intelligence platform with LLM-based querying and 3D visualization. Rebuilt ingestion pipeline to handle multi-terabyte datasets (PySpark, Pandas), added real-time telemetry streaming with event-driven architecture, hardened API backend (Python/FastAPI), and established CI/CD across repositories.

### Principal Engineer, Istari Digital
*Feb 2024 - Jul 2025 · New York, NY*

Istari Digital focuses on interconnected digital systems where secure, shareable digital threads facilitate the development of cyber‑physical systems. The platform enables zero‑trust, zero‑knowledge security while connecting and enabling the automation of tools as Cameo, CATIA, Nastran, OpenFOAM and other computational modeling suites to accelerate digital‑twin development and facilitate secure collaboration.

- Designed cryptographically verified asset lineage and DoD‑compliant control tagging to preserve dependencies, provenance, and tooling metadata without exposing sensitive payloads—enabling zero-knowledge collaboration, data sovereignty, and frictionless sharing among engineers, teams, and organizations.
- Led team building secure backend registry service (Python, FastAPI, SQLAlchemy, PostgreSQL, Zanzibar, Authzed) and SDK. Designed database schema for asset relationships and metadata, tuned queries for complex lineage traversal, and managed zero-downtime migrations. Cryptographic core written in Rust with bindings for Python and WebAssembly, wrapped by Python and TypeScript SDKs for automation agents and frontend.
- Ensured CI/CD validated all compliance requirements on each release, publishing results for ATO submission to minimize approval effort for deployment on secure and classified networks. Delivered all major milestones on time and successfully relaunched product for commercial and government clients.

### Director of Software Development, Raytheon Technologies
*Sep 2021 - Nov 2023 · New York, NY*

Rejoined what was formerly the UTC Digital Accelerator (DX)—reorganized post‑merger as Enterprise Data Services (EDX)—to build a next‑generation data platform for Raytheon aerospace applications.

- Technical lead for pathfinder initiatives building real-time flight telemetry pipelines for multiple models of Pratt & Whitney commercial jet engines. Built streaming data platform (Databricks, Spark, Python) where sensor data from thousands of engine sensors was evaluated by fault detection algorithms and scored by multiple failure prediction and anomaly detection models, triggering automated alerts with responses proportional to severity—from grounding aircraft for emergency maintenance to scheduling inspection.
- Designed ML model training and orchestration pipeline with comprehensive audit trails tracing every output field back to specific code revisions or model versions. Implemented parallel evaluation of multiple models without adding latency using asynchronous patterns and concurrent processing.
- Led effort to "inner-source" code to address common problems: SDKs for parsing proprietary engine data formats, quickstart kits for Databricks projects, and synthetic data generators.
- Led team of 14 developers across three agile projects while supervising onboarding resources and migration support for 40+ teams adopting the new Databricks platform.

### Head of Technology, Dayforward
*Jan 2020 - Sep 2021 · New York, NY*

Head of technology and development lead for a life‑insurance startup. Led a small team that designed and built the company’s algorithmic underwriting and policy‑management platform. The platform comprised containerized Go gRPC microservices deployed on Kubernetes and exposed via a federated GraphQL API to a Vue.js frontend. Initial development was completed in under ten months, and the platform launched the same day the company received regulatory approval.

### Director of Software Engineering, UTC Aerospace Systems
*Feb 2019 - Jan 2020 · Brooklyn, NY*

Managed a team of 17 engineers at the UTC Digital Accelerator in Brooklyn. Oversaw multiple project teams—from IoT sensors and mobile apps for industrial refrigeration to standardized design systems and developer tools. As the frontend engineering director, led efforts to normalize, document and evangelize engineering processes, standards and best practices.

### Lead Engineer / Chief Technologist, Riverdrop
*Jan 2018 - Feb 2019 · New York, NY*

Served as chief technologist for an early‑stage startup and led a team of three senior engineers to build a specialized product search engine for a specific vertical market.

- Designed and implemented ML-driven ETL pipeline (Python, spaCy, NLTK, scikit-learn) for product identification and NLP-based entity extraction, with image recognition and classification models on AWS SageMaker using OpenCV and scikit-image for preprocessing and color analysis.
- Built asynchronous data flow using AWS SQS/SNS for event-driven processing with DynamoDB for metadata storage, implementing retry logic, dead-letter queues, and idempotency for reliable processing. Developed search API in Go against Elasticsearch indexes and React.js/TypeScript frontend.
- Architected system as microservices with discrete transformation steps, each packaged as Docker images and deployed via CI/CD to Kubernetes (built and managed with Terraform).

### Director of Engineering (Mobile), MediData
*Feb 2017 - Jan 2018 · New York, NY*

Led engineering teams responsible for the Patient Cloud platform, which collects clinical trial data directly from patients and clinicians via mobile devices and wearable sensors.

- Managed products including ePRO (iOS/Android patient outcomes), Patient Cloud (iOS clinician outcomes), AppConnect (native SDK), Sensor Link (wearables platform), and supporting backend. Launched two major mobile initiatives and migrated all native development to Swift and Kotlin.
- Instituted organizational and process improvements that increased average team velocity by 2.5×.

### Principal Architect / Director of Mobile, Huge
*May 2013 - Feb 2017 · Brooklyn, NY*

Started as Principal Architect and was later promoted to Director of Mobile.

- Led cross‑functional team of 20+ iOS, Android, and backend engineers, QA analysts, designers, and product managers. Evangelized agile best practices, continuous integration and continuous delivery.
- Instituted engineering guild system for cross‑office knowledge sharing and formal sponsorship of guild‑proposed R&D initiatives. One guild‑led initiative generated a new product proposal that secured a $5M development contract.
- Championed innovation through new technology investigations (interior way‑finding, Arduino and embedded system prototypes), engineering blog, meetups, and open‑source contributions.
- Directed notable client projects including smart Bluetooth audio/video accessories with live streaming and voice commands, companion app for AAA game publisher that scanned players into avatars, and numerous B2B and B2C mobile commerce applications.

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
