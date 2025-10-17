# Michael L. Welles
- **Address:** 5657 NY-97, Narrowsburg NY 12764
- **Phone:** 917-586-9218
- **Email:** mlwelles@gmail.com

## Overview

Hands-on engineering leader with decades of experience building safety-critical and data-intensive products. Advocate for efficient processes, clear communication, and the adoption of best practices in software development. I partner closely with product and operations to set pragmatic guardrails, automate quality signals, and model the engineering culture I expect—clear communication, strong code hygiene, and accountability. Comfortable pairing strategic architecture decisions with deep dives into code, infrastructure, and tooling.

## Experience

### Consulting Principal Engineer, CubeNexus.ai
*Aug 2025 - Present · Remote*

CubeNexus.ai builds a geospatial intelligence platform that pairs an LLM based natural language interface for querying temporal-spatial datasets with an dynamically updating interactive 3D visualization of the results.   I've been advising technical strategy across ingestion, analytics, and user experience, while diving deep in the codebase to bring it from prototype to production ready.

- Hardened the API backend with rebuilt auth and token handling, added formalized validation, and refactored code paths for clarity and performance.
- Added support for live streaming of telemetry from the drones developed by the company.  Wired in Ably to the drone controller, the backend, and frontend WebGL visualizer.  Successfully demonstrated during a live flight of sensor equipped drone, the front-end rendering a visualization of its flight path and sensor readings on the globe in real-time. 
- Added CI/CD to all project repositories with static analysis, automated tests, build and deployment automation.
- Rewrote the ingestion pipeline to transforms geospatial data into the proprietry format at the core of the company IP so as to be able to handle datasets of the size that are produced by industry.  (PySpark, Pandas)

### Principal Engineer, Istari Digital
*Feb 2024 - Jul 2025 · New York, NY*

Istari Digital focuses on interconnected digital systems where secure, shareable digital threads facilitate the development of cyber‑physical systems. The platform enables zero‑trust, zero‑knowledge security while connecting and enabling the automation of tools as Cameo, CATIA, Nastran, OpenFOAM and other computational modeling suites to accelerate digital‑twin development and facilitate secure collaboration.

- Designed cryptographically verified asset lineage that preserves dependencies, provenance, and tooling metadata without exposing sensitive payloads—enabling zero-knowledge collaboration and trustworthy automation.
- Implemented DoD‑compliant control tagging to ensure customers retain data sovereignty. This provided strict controls and audit trails while enabling frictionless sharing of models and artifacts among individual engineers, teams and organizations.
- Led team building secure back end registry service (Python, FastAPI, SQLAlchemy, Zanzibar, Authzed) and the SDK for it.  The cryptographic core of the SDK was written in rust, with bindings exported for Python and WebAssembly. These were wrapped by the Python and TypeScript SDKs used by internal and client developers to build automation agents and the frontend web application.
- Ensured that the CI/CD build automation validated that all compliance requirements were met on each release, and the results published in a format suitable for submission for compliance review to minimize the effort and time spent for each to receive ATO approval for deployment on secure and classified networks. 
- Delivered all major program milestones on time and successfully relaunched the product for commercial and government clients.

### Director of Software Development, Raytheon Technologies
*Sep 2021 - Nov 2023 · New York, NY*

Rejoined what was formerly the UTC Digital Accelerator (DX)—reorganized post‑merger as Enterprise Data Services (EDX)—to build a next‑generation data platform for Raytheon aerospace applications.

- Technical lead for pathfinder initiatives developing streaming flight telemetry pipelines for multiple models of Pratt & Whitney commercial jet engines.  
- As the data from the thousands of sensors on an engine streamed in it was checked by both a variety of fault detection algorithms, as well being scored by a number of failure prediction and anomaly detection models. 
- The pipeline was designed so that any number of these could be attached, without adding latency overall.  
- Faults flagged by any of these would triggered alerts, with responses proportional to severity and confidence of what was flagged -- from grounding aircraft for emergency maintenance, scheduling inspection at subsequent destinations, or simply flagging the data for manual review by a human operator.    
- Maintained comprehensive audit trails to trace the lineage of every output field back to specific code revisions or model versions, enabling reproducibility.
- Managed model‑training workflows with rigorous versioning; captured code revisions, training datasets and snapshots and hyperparameters so results could be reproduced.
- Technologies included Databricks, Spark, Python, SparkML, scikit‑learn and Pandas.
- Let effort to "inner-source" code to address common problems faced by development teams at the company:  SDKs for parsing proprietary engine data formats, quickstart kits for Databricks projects, synthetic data generators, etc...
- Led a team of 14 developers and contractors split across three agile project teams.
- Supervised creation of onboarding resources for more than 40 teams, publishing guidelines, standards, best practices and reference project templates.
- Assisted and advised these advised external teams in migrating their existing data pipelines and data scient projects from legacy infrastructure to the new Databricks platform.

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
