# Index-of-GCP-1000-credits-usecase

## 💳 Credit Overview

- **Amount:** $1,000 USD
    
- **Product Name:** Trial credit for GenAI App Builder (Vertex AI Agent Builder)
    
- **Duration:** 12 months from issuance
    
- **Key Purpose:** Building enterprise-grade AI Agents and Search engines grounded in your own data.
    

## ✅ What You CAN Use It For

These credits are strictly applied to **Vertex AI Agent Builder** (formerly known as GenAI App Builder). They cover:

### 1. Vertex AI Search (RAG)

Build a search engine that "knows" your personal or enterprise data.

- **Use Case:** Upload your Obsidian vault (PDF/Markdown) to GCP and create a private search engine that answers questions based _only_ on your notes.
    
- **SKU:** Search Standard/Enterprise.
    

### 2. Vertex AI Conversation (Agents)

Create advanced chat agents with "tools" and "playbooks."

- **Use Case:** Build an AI assistant that can check your calendar, read your emails, or interact with APIs to perform tasks.
    
- **SKU:** Agent Standard/Enterprise.
    

### 3. Grounded Generation API

Calling Gemini models where the output is "grounded" in specific sources.

- **Use Case:** Ensuring the AI doesn't hallucinate by forcing it to cite your documents or Google Search results.
    

## ❌ What You CANNOT Use It For

**Warning:** Using these services will charge your standard billing method (credit card) and will **NOT** use the $1,000 credit:

- **General Gemini API:** Direct calls to `gemini-1.5-pro` via AI Studio API keys.
    
- **Vertex AI Studio:** Basic "Multimodal" testing or playground prompts.
    
- **Compute Engine:** Virtual machines (VMs) or GPUs.
    
- **Cloud Storage:** While small amounts are needed for agents, standard storage costs aren't covered by this specific AI voucher.
    
- **BigQuery:** Data warehousing costs.
    

## 🚀 Practical Project Ideas

1. **The "Obsidian Brain":** Use the credits to index your `Obsidian` notes via Vertex AI Search. Use an agent to summarize themes across 100+ different notes instantly.
    
2. **Automated Researcher:** Use the "Grounding with Google Search" feature to build an agent that researches a topic and provides a list of citations without using your personal API limits elsewhere.
    
3. **Agentic Workflows:** Connect these agents to `n8n` to trigger real-world actions (sending emails, updating databases) based on AI reasoning.
    

## 🔗 Useful Links

- [Official Pricing & Credit Details](https://cloud.google.com/generative-ai-app-builder/pricing "null")
    
- [Vertex AI Agent Builder Console](https://console.cloud.google.com/gen-app-builder/ "null")