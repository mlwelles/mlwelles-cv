# Michael L. Welles
**917-586-9218 | mlwelles@gmail.com**

---

I'm reaching out about the Principal Software Engineer role at LightSpun because the combination of healthcare compliance, Python-first architecture, and AI integration hits right in my wheelhouse. I've spent the last few years building regulated systems where getting it wrong has real consequences—insurance underwriting platforms that need regulatory approval before launch, aerospace telemetry systems where false negatives could ground commercial aircraft, and DoD-compliant collaboration tools that handle sensitive engineering data.

The Dayforward story is probably the most relevant. We built a life insurance underwriting platform from scratch with a hard deadline: we couldn't launch until New York State approved us, and the entire business depended on that approval. I led the technical side—Go microservices on Kubernetes, everything designed with auditability and compliance baked in from day one. We shipped in under ten months and launched the same day we got regulatory approval. That experience taught me how to build systems where compliance isn't a checkbox at the end but a design constraint from the start. It sounds like HITRUST and SOC 2 are non-negotiable for you, and I get why—healthcare admin is one of those domains where security theater won't cut it.

More recently at Raytheon, I built real-time telemetry pipelines for commercial jet engines using Python, Databricks, and Spark. Thousands of sensors streaming through fault detection models, with automated alerts ranging from "schedule an inspection" to "ground this aircraft immediately." The interesting challenge wasn't just the scale—it was the audit trail. Every alert had to trace back through model versions, code commits, and data lineage. We implemented that with async patterns and concurrent processing so we could evaluate multiple models in parallel without adding latency. That kind of observability and traceability seems critical for what you're building, especially with AI-driven decisions in credentialing and claims management.

The AI piece is what makes this particularly interesting right now. At CubeNexus, I've been advising on LLM-based querying for geospatial intelligence—figuring out how to make these systems reliable and auditable when the underlying models are probabilistic. The phrase "agentic AI" in your job description suggests you're thinking about similar challenges: how do you build scalable, compliant systems when part of your stack is a language model that can't guarantee deterministic output? I've been deep in that problem space, and I'd love to compare notes on your approach.

I've also spent a lot of time mentoring and leading teams through architectural decisions. At Raytheon, I managed 14 developers across three projects while supporting 40+ teams migrating to a new platform. At Huge, I ran engineering guilds where teams proposed R&D initiatives—one of those turned into a $5M contract. At MediData, I helped a mobile team increase velocity by 2.5× by tightening up CI/CD and process. The Principal role you're describing sounds like it's about both technical architecture and setting the cultural tone for how engineering works at LightSpun, and that's exactly the kind of leverage I'm looking for.

Your tech stack—Python, cloud platforms, Kubernetes, distributed systems—maps directly to the last decade of my career. I've worked in AWS, Azure, and GCP across different projects, and I'm comfortable with the whole containerization and orchestration layer. Golang is a plus for you, and I've built production systems in Go (Dayforward's entire backend, Riverdrop's search API). But honestly, what matters more than language fluency is understanding how to design systems that scale, stay observable, and don't fall over when something inevitably goes wrong.

Healthcare is also a domain I've touched—MediData was clinical trials, which shares a lot of the same regulatory complexity as insurance. And insurance underwriting at Dayforward gave me direct experience with the payer side. I know enough about the space to understand why credentialing, onboarding, and claims management are painful problems worth solving, and why getting them right matters.

I'm drawn to early-stage environments where you're still figuring out the architecture and culture. LightSpun sounds like it's at that inflection point—growing fast, tackling hard technical problems, and building something that actually makes a difference in how healthcare administration works. I'd love to talk more about how I can help shape that.

Looking forward to hearing from you.

Michael Welles
