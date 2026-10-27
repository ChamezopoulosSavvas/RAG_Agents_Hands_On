# Agents Hands-On

Notebooks on building agentic AI with LangChain and LangGraph.

## Contents

0. RAG fundamentals: vector DBs, chunking, prompt engineering, decoupling, contextual query rewriting, HyDE, fusion search
1. Hands-on with LangChain
2. Tool use with LangChain
3. RAG with LangChain
4. Controlled workflows with LangGraph

All notebooks are in [notebooks/](notebooks/).

## Setup

Requires Python 3.13 and [uv](https://docs.astral.sh/uv/).

```bash
uv sync
uv run pre-commit install
```

Add your API keys to a `.env` file.

## Pre-commit

Hooks run ruff (lint and format) and strip notebook outputs before each commit.
