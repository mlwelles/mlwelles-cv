# Michael L. Welles
- **Address:** 38 Covert St, Brooklyn NY 11207
- **Phone:** 917-586-9218
- **Email:** mlwelles@gmail.com

## Overview

Principal Engineer and Software Architect with 15+ years of architectural leadership building complex, workflow-driven systems in regulated industries. Expert in simplifying intricate business logic, designing scalable backend architectures, and integrating AI/LLM capabilities into production systems. Proven track record scaling B2B2C platforms, leading teams through rapid growth (2.5× velocity increase at MediData), and delivering mission-critical systems under strict compliance requirements in healthcare, aerospace, and financial services.

## Core Technologies

**Languages & Frameworks:** Python, Go, Rust, TypeScript, Swift, Objective-C, Kotlin, Java
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

Istari Digital enables zero‑trust digital collaboration for cyber‑physical systems, connecting engineering tools (Cameo, CATIA, Nastran, OpenFOAM) to enable the programmatic and AI-assisted automation of digital engineering workflows.

- Designed cryptographically verified asset lineage and DoD‑compliant control tagging to preserve dependencies, provenance, and tooling metadata without exposing sensitive payloads—enabling zero-knowledge collaboration, data sovereignty, and frictionless sharing among engineers, teams, and organizations.
- Led team building secure backend registry service (Python, FastAPI, SQLAlchemy, PostgreSQL, Zanzibar, Authzed) and SDK. Designed database schema for asset relationships and metadata, tuned queries for complex lineage traversal, and managed zero-downtime migrations. Cryptographic core written in Rust with bindings for Python and WebAssembly, wrapped by Python and TypeScript SDKs for automation agents and frontend.
- Ensured CI/CD validated all compliance requirements on each release, publishing results for ATO submission to minimize approval effort for deployment on secure and classified networks. Delivered all major milestones on time and successfully relaunched product for commercial and government clients.

### Director of Software Development, Raytheon Technologies
*Sep 2021 - Nov 2023 · New York, NY*

Led development of next‑generation data platform for aerospace applications at Enterprise Data Services (formerly UTC Digital Accelerator).

- Technical lead for pathfinder initiatives building real-time flight telemetry pipelines for Pratt & Whitney commercial jet engines. Built streaming data platform (Databricks, Spark, Python) processing thousands of engine sensors through fault detection and anomaly detection models, triggering severity-based automated alerts from emergency grounding to routine inspection scheduling.
- Designed ML model training and orchestration pipeline with comprehensive audit trails tracing every output field back to specific code revisions or model versions—critical for safety certification. Implemented parallel evaluation of multiple models without adding latency using asynchronous patterns and concurrent processing.
- Led effort to "inner-source" code to address common problems: SDKs for parsing proprietary engine data formats, quickstart kits for Databricks projects, and synthetic data generators.
- Led team of 14 developers across three agile projects while supervising onboarding resources and migration support for 40+ teams adopting the new Databricks platform.

### Head of Technology, Dayforward
*Jan 2020 - Sep 2021 · New York, NY*

Head of technology for a life‑insurance startup. Led team that designed and built algorithmic underwriting and policy‑management platform with complex rule-based workflows for risk assessment and regulatory compliance. Built platform with Go microservices on Kubernetes, federated GraphQL API, and Vue.js frontend. Initial development completed in under ten months, launching same day the company received regulatory approval.

### Director of Software Engineering, UTC Aerospace Systems
*Feb 2019 - Jan 2020 · Brooklyn, NY*

Managed a team of 17 engineers at the UTC Digital Accelerator in Brooklyn. Oversaw multiple project teams—from IoT sensors and mobile apps for industrial refrigeration to standardized design systems and developer tools. Led efforts to normalize, document and evangelize engineering processes, standards and best practices.

### Lead Engineer / Chief Technologist, Riverdrop
*Jan 2018 - Feb 2019 · New York, NY*

Chief technologist for early‑stage startup. Led team of three senior engineers building specialized product search engine.

- Designed and implemented ML-driven ETL pipeline (Python, spaCy, NLTK, scikit-learn) for product identification and NLP-based entity extraction, with image recognition and classification models on AWS SageMaker using OpenCV and scikit-image for preprocessing and color analysis.
- Built asynchronous data flow using AWS SQS/SNS for event-driven processing with DynamoDB for metadata storage, implementing retry logic, dead-letter queues, and idempotency for reliable processing. Developed search API in Go against Elasticsearch indexes and React.js/TypeScript frontend.
- Architected system as microservices with discrete transformation steps, each packaged as Docker images and deployed via CI/CD to Kubernetes (built and managed with Terraform).

### Director of Engineering (Mobile), MediData
*Feb 2017 - Jan 2018 · New York, NY*

Led engineering teams for Patient Cloud platform, a B2B2C healthcare system connecting pharmaceutical manufacturers, clinical trial sites, and patients. Platform collected clinical trial data directly from patients and clinicians via mobile devices and wearable sensors under strict HIPAA compliance and FDA requirements.

- Managed products including ePRO (iOS/Android patient outcomes), Patient Cloud (iOS clinician outcomes), AppConnect (native SDK), Sensor Link (wearables platform), and supporting backend services. Architected data pipelines ensuring end-to-end encryption, audit trails, and regulatory compliance for patient health data across multiple stakeholders.
- Designed and implemented workflow engines for configurable clinical trial protocols, enabling pharma sponsors to define complex data collection schedules, conditional logic, and patient visit workflows without code changes.
- Launched two major mobile initiatives and migrated all native development to Swift and Kotlin while maintaining zero downtime for active clinical trials across 80+ countries.
- Instituted organizational and process improvements that increased average team velocity by 2.5×.

### Principal Architect / Director of Mobile, Huge
*May 2013 - Feb 2017 · Brooklyn, NY*

- Led cross‑functional team of 20+ iOS, Android, and backend engineers, QA analysts, designers, and product managers. Evangelized agile best practices, continuous integration and continuous delivery.
- Instituted engineering guild system for cross‑office knowledge sharing and formal sponsorship of guild‑proposed R&D initiatives. One guild‑led initiative generated a new product proposal that secured a $5M development contract.
- Championed innovation through new technology investigations (interior way‑finding, Arduino and embedded system prototypes), engineering blog, meetups, and open‑source contributions.
- Directed notable client projects including smart Bluetooth audio/video accessories with live streaming and voice commands, companion app for AAA game publisher that scanned players into avatars, and numerous B2B and B2C mobile commerce applications.

### Manager of Mobile Technology, Consumer Reports
*Jul 2011 - May 2013 · Yonkers, NY*

Founded mobile applications group and built in‑house team for iOS/Android development. Developed and launched flagship ratings application and managed external vendors maintaining portfolio of legacy apps.

### Senior Software Engineer – iTunes Store Video Workflow Group, Apple
*Mar 2008 - May 2011 · Cupertino, CA*

Senior engineer on a team of five responsible for encoding and assembling all iTunes video media. Owned the encoding toolchain used by the processing cluster, specified deliverable media formats, developed validation test suites, and created reference media for hardware compliance testing. Led two major workflow rewrites for HDTV launch and international video expansion.

### Senior Software Architect, The New York Times
*Aug 2007 - Mar 2008 · New York, NY*

Created tools for managing releases and production deployment. Oversaw offshore CMS development.

### Founder, Partner, Bangstate
*Jun 1999 - Mar 2008 · New York, NY*

Founded and managed a small five person development consultancy. Oversaw the business and delivered projects for clients including The Associated Press, American Bar Association, Atlantic Records, Forbes Magazine, CIR/SEIU and Time Inc.

## Education

### Bachelor of Arts in History, The University of Chicago
*Chicago, IL*
