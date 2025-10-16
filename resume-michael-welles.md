# Michael L. Welles
- **Address:** 5657 NY-97, Narrowsburg NY 12764
- **Phone:** 917-586-9218
- **Email:** mlwelles@gmail.com

## Overview

Software engineer and technology leader with decades of experience building products and leading teams under tight deadlines and strict quality constraints. Advocate for efficient processes, clear communication, and best practices in software development. My experience ranges from writing firmware for embedded devices to architecting distributed systems that process complex encoding workflows across thousands of machines.

## Experience

### Consulting Principal Engineer, CubeNexus.ai
*Sep 2025 - Present · Remote*

CubeNexus.ai builds a geospatial intelligence platform that fuses AI-assisted data ingestion, spatial analytics and 3D visualization for industrial and defense customers. I lead the technical strategy across ingestion, analytics, and user experience.

- Re-architected the AI backend into containerized FastAPI microservices for intent classification, aggregation, retrieval and orchestration, with Dockerized pipelines to Elastic Beanstalk that cut release friction and enabled parallel service scaling.
- Built a unified AWS control plane that ties Cognito, DynamoDB, S3, SQS and Bedrock together with real-time channels via Ably, formalizing uv-based development workflows, automated CI, and smoke/integration suites for the API surface.
- Led the WebGPU-enabled Next.js front end, wiring secure auth, Pro-tier billing and the 3D visualizer to backend services while instituting Jest/React Testing Library coverage and shared component libraries.
- Delivered a high-performance geospatial ingestion and intent analytics stack: streaming CSV parser with layered elevation services, TULSA coordinate conversion and Lambda-compatible Intent API featuring R-tree indexing, correlation analytics and trajectory modeling.

### Principal Engineer, Istari Digital
*Feb 2024 - Jul 2025 · New York, NY*

Istari Digital focuses on interconnected digital systems where secure, shareable digital threads facilitate the development of cyber‑physical systems. The platform enables zero‑trust, zero‑knowledge security while connecting to tools such as Cameo, CATIA, Nastran, OpenFOAM and other computational modeling suites to accelerate digital‑twin development and facilitate secure collaboration.

- Software architect and technical lead for zero-trust, zero-knowledge core platform rewrite to meet the strict security and compliance needs of defense and aerospace customers while still providing for frictionless workflow automation, secure collaboration, and trust in the integrity of cryptographically verified and version managed digital assets, preserving a complete digital thread not just of the changes to the assets but to their dependencies and lineage – what versions of what assets were used in the production of what versions which other assets, what tools were used to do so and by whom. All without the back end ever accessing any of sensitive contents of the files themselves.
- Implemented DoD‑compliant control tagging to ensure customers retain data sovereignty. This provided strict controls and audit trails while enabling frictionless sharing of models and artifacts among individual engineers, teams and organizations.
- Delivered all major program milestones on time and successfully relaunched the product for commercial and government clients.
- Led two teams designing and implementing a secure back end registry service in Python and the SDKs for accessing it. The cryptographic core was written in Rust and compiled into Python bindings and WebAssembly, forming the foundation for the Python and TypeScript libraries used by automation agents and the web application.

### Director of Software Development, Raytheon Technologies
*Sep 2021 - Nov 2023 · New York, NY*

Rejoined what was formerly the UTC Digital Accelerator (DX)—reorganized post‑merger as Enterprise Data Services (EDX)—to build a next‑generation data platform for Raytheon aerospace applications.

- Technical lead for pathfinder initiatives developing streaming flight telemetry pipelines for multiple models of Pratt & Whitney commercial jet engines.
- Designed systems where, upon gate arrival, aircraft connect to ground stations to upload telemetry from thousands of sensors monitoring engines and control surfaces.
- Within minutes, processed datasets and applied algorithmic fault detection, machine‑learning failure prediction and anomaly detection models.
- Triggered alerts with responses proportional to severity and confidence—from grounding aircraft for emergency maintenance to scheduling inspection at subsequent destinations.
- Maintained comprehensive audit trails to trace the lineage of every output field back to specific code revisions or model versions, enabling reproducibility.
- Managed model‑training workflows with rigorous versioning; captured code revisions, training datasets and hyperparameters so results could be reproduced.
- Technologies included Databricks, Spark, Python, SparkML, scikit‑learn and Pandas.
- Led a team of 14 developers and contractors split across three agile project teams.
- Supervised creation of onboarding resources for more than 40 teams, publishing guidelines, standards, best practices and reference project templates.
- Oversaw teams porting and optimizing existing internal data science and machine‑learning libraries and tools to the new platform.

### Head of Technology, Dayforward
*Jan 2020 - Sep 2021 · New York, NY*

Head of technology and development lead for a life‑insurance startup. Led a small team that designed and built the company’s algorithmic underwriting and policy‑management platform. The platform comprised containerized Go gRPC microservices deployed on Kubernetes and exposed via a federated GraphQL API to a Vue.js frontend. Initial development was completed in under ten months, and the platform launched the same day the company received regulatory approval.

### Director of Software Engineering, UTC Aerospace Systems
*Feb 2019 - Jan 2020 · Brooklyn, NY*

Managed a team of 17 engineers at the UTC Digital Accelerator in Brooklyn. Oversaw multiple project teams—from IoT sensors and mobile apps for industrial refrigeration to standardized design systems and developer tools. As the frontend engineering director, led efforts to normalize, document and evangelize engineering processes, standards and best practices.

### Independent Contractor, Barking For Centuries, LLC
*Jan 2018 - Feb 2019 · New York, NY*

Served as chief technologist for an early‑stage startup and led a team of senior contractors to build a vertical product search engine.

- Designed and implemented an ETL pipeline built around custom machine‑learning infrastructure for product identification and extraction. The pipeline was written in Python with NLP components using spaCy for classification and entity extraction, along with NLTK and scikit‑learn.
- Developed product image recognition and classification models on AWS SageMaker, with preprocessing and color analysis using OpenCV and scikit‑image.
- Used DynamoDB and AWS SQS/SNS for data flow and message storage.
- Built the search API in Go against Elasticsearch indexes and developed the web frontend in React.js.
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

Founded the mobile applications and new media group and built an in‑house team responsible for mobile application development. Defined mobile product strategies and led technical execution. Launched the flagship ratings application and managed external vendors maintaining a portfolio of legacy apps.

### Senior Software Engineer – iTunes Store Video Workflow Group, Apple
*Mar 2008 - May 2011 · Cupertino, CA*

Senior engineer on a team of five responsible for encoding and assembling all iTunes video media. Owned the encoding toolchain used by the processing cluster and specified deliverable media formats, developed test suites to validate them and created reference media for hardware compliance testing. Contributed to continuous improvement and day‑to‑day operations, business production and the engineering of visual and audio quality of Store media. Led two major rewrites of the video workflow: one for the HDTV launch and another for international video and television.

### Senior Software Architect, The New York Times
*Aug 2007 - Mar 2008 · New York, NY*

Led the incorporation of continuous integration into the development and release processes of NYTimes.com. Created tools, procedures and processes for testing and packaging software through the production pipeline and authored automation tools. Supervised overall architectural design for the development of a new content management system.

### Founder, Partner, Bangstate
*Jun 1999 - Mar 2008 · New York, NY*

Founded and managed a consultancy of five principal partners and ten additional developers, designers and administrators. Oversaw the business and delivered projects for clients including The Associated Press, American Bar Association, Atlantic Records, Forbes Magazine, CIR/SEIU and Time Inc. Notable projects included TNEWS, an Internet distribution platform for the Associated Press that used standards‑based protocols (NNTP, IPTC NITF XML) to distribute content previously available only via proprietary satellite feeds, and handheld applications for the Military Family Research Institute at Purdue University.

### Senior Software Developer, The Associated Press
*Jun 2003 - Sep 2006 · New York, NY*

Designed and developed high‑traffic, dynamic systems for distributing, processing and displaying multimedia news content. Notable project: AP Hosted Elections, which gathered, processed and presented up‑to‑the‑minute results for the 2004 U.S. presidential election and served as the sole source of data for all major U.S. news organizations.

## Education

### Bachelor of Arts in History, The University of Chicago
*Chicago, IL*

### Bachelor of Arts in History, The University of Chicago
*Chicago, IL*
