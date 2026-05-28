<p align="center">
  <img src="https://cdn-icons-png.flaticon.com/512/1037/1037049.png" alt="TLD Tracker Logo" width="100">
</p>

<h1 align="center">
  tld-tracker
</h1>

<p align="center">
  <strong>↻ automatically track every official IANA TLD</strong><br>
  <sub>clean lists • minimal automation • daily sync</sub>
</p>

<p align="center">
  <a href="https://github.com/stukryptx/tld-tracker/actions/workflows/sync.yml"><img src="https://img.shields.io/github/actions/workflow/status/stukryptx/tld-tracker/sync.yml?style=for-the-badge&logo=githubactions&label=sync&color=0a0f1e" alt="Sync Status"></a>
  <a href="https://www.iana.org/domains/root/db"><img src="https://img.shields.io/badge/data-IANA_Official-2a2f3f?style=for-the-badge&logo=icann&logoColor=white" alt="Data Source"></a>
  <a href="https://github.com/stukryptx/tld-tracker/blob/main/tlds.md"><img src="https://img.shields.io/badge/🌐-tlds.md-2a2f3f?style=for-the-badge" alt="TLD List"></a>
  <a href="https://github.com/stukryptx/tld-tracker/blob/main/tlds_info.md"><img src="https://img.shields.io/badge/📄-tlds_info.md-2a2f3f?style=for-the-badge" alt="TLD Info"></a>
</p>

<br>

<p align="center">
  <i>No bloat. Just the root zone.</i>
</p>

---

## ✧ what it does

> A tiny automation that mirrors the official IANA TLD list — generated, versioned, and always up‑to‑date.

<br>

<div align="center">

|                                     |                                                               |
| ----------------------------------- | ------------------------------------------------------------- |
| 🧩 **two clean outputs**            | `tlds.md` (newline‑separated) + `tlds_info.md` (with metadata) |
| ⚙️ **pure Python automation**       | fetches → parses → writes → commits                          |
| 🔁 **GitHub‑synced**                | runs on schedule or push                                     |
| 📡 **source**                       | [IANA Root Zone Database](https://www.iana.org/domains/root/db) |

</div>

<br>

## ✧ preview

### `tlds.md` — just the names
```text
com
org
net
edu
gov
mil
...
