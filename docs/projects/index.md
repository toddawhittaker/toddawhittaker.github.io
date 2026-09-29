---
title: Projects
---

# Projects

*Open-source software on [GitHub](https://github.com/toddawhittaker){:target="_blank"}*

## AI and higher education

### [IPEDS Oracle](https://github.com/toddawhittaker/ipeds-oracle){:target="_blank"}
Python and React
{: .dates}

Ask questions about U.S. colleges and universities in plain English and get answers with tables and charts, with no SQL or spreadsheets. It draws on IPEDS (the Integrated Postsecondary Education Data System), the U.S. Department of Education's annual census of colleges, covering degrees awarded, enrollment, tuition and aid, graduation rates, and admissions. A large language model turns each question into a database query, runs it, checks the numbers, and explains the answer. It is a self-hosted web app.

### [Portikus](https://github.com/toddawhittaker/portikus){:target="_blank"}
TypeScript
{: .dates}

A browser-based development workspace for students learning agentic software development, where AI coding agents do much of the writing. Each student gets a real Linux workspace with Git, Docker, terminals, and coding agents, reached through an ordinary web browser, so no one loses the first week to installing tools on a laptop. Instructors can see and manage student workspaces, including quotas and lifecycle.

### [Harness proof of concept](https://github.com/toddawhittaker/harness-poc){:target="_blank"}
Python
{: .dates}

A working miniature of an institution-owned AI layer that sits above a university's systems and answers questions for people in different roles. Its point is architectural: the user's own identity travels with every request, and access is checked independently at every layer, so the AI never acts as an all-seeing service account. It joins student records, learning management, catalog, and labor-market data (all fictional) through the Model Context Protocol (MCP), a standard way for AI models to call tools, and keeps an audit trail of every request.

### [Pulse Surveys](https://github.com/toddawhittaker/pulse-surveys){:target="_blank"}
Python, in development
{: .dates}

A tool that plugs into a learning management system to run a short, confidential feedback survey in every course each week. Instructors get a Monday report with an AI-written summary and publish a response that students see, which closes the loop. Chairs, deans, and academic leaders see roll-ups across the courses they oversee. The design goal is trust: students must believe their answers are confidential, and instructors must believe the data is fair.

## Networking and home lab

### [pfSense Docker Alias](https://github.com/toddawhittaker/pfsense-docker-alias){:target="_blank"}
Python
{: .dates}

A small container that keeps DNS (domain name system) entries in a pfSense firewall in step with Docker. It watches containers start and stop, reads their labels, and adds or removes the matching host names, so services behind a reverse proxy are reachable by name without editing DNS by hand.

### [Tailscale Direct Watchdog for pfSense](https://github.com/toddawhittaker/tailscale-direct-pfsense){:target="_blank"}
Shell
{: .dates}

A watchdog for pfSense routers running Tailscale, a private network service. When Tailscale falls back to relaying traffic through its servers even though a direct connection normally works, the watchdog notices and restarts Tailscale to restore the direct link, with an optional notification.

## How I build with AI

I build these projects with heavy use of AI coding assistants, and I say so plainly. In [AI-Assisted Software Engineering](https://github.com/toddawhittaker/ipeds-oracle/blob/main/docs/AI_ASSISTED_ENGINEERING.md){:target="_blank"}, I argue that AI is the next step in a long line of programming abstractions. Like compilers before it, it draws the charge that it "isn't real engineering," and like them, it moves the engineer's judgment up a level rather than removing it.

The line was never whether a model helped write the code. It's whether the change was subjected to engineering discipline. In my projects, that discipline means:

- tests that guard real behavior, written first for anything that can regress;
- coverage minimums enforced on every module, not just overall;
- one merge gate that runs the whole build and test pipeline before anything reaches the main branch;
- explicit review passes for correctness, security, and accessibility; and
- documentation updated in the same change as the code it describes.

The assistant speeds up the writing, and the gates decide what survives. Judge my software, and anyone's, by its tests, its structure, its security, and whether it does what it claims, not by the tools that produced it.
