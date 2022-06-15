{attckr} A Toolkit for Analysis & Visualization of ATT&CK Incident Data for
Service Providers & Organizations
Bob Rudis · Chief Data Scientist · Rapid7
ATT&CKcon 2019

hrbrmstr://about
30+ Years in Cybersecurity (20+ in Fortune 50 global organizations)
Former team lead for the Verizon Data Breach Investigations Report
Co-author of one of the 1st books on"doing data science" in Cybersecurity
Over a petabyte of planetary-scale internet telemetry data analyzed daily
90+ packages with a focus on cybersecurity & internet telemetry

@hrbrmstr research@rapid7.com
bob@rud.is https://rud.is/ https://github.com/hrbrmstr https://blog.rapid7.com/

github.com/hrbrmstr/attckr gitlab.com/attckr
bitbucket.com/attckr git.src.ht/~hrbrmstr/attckr git.rud.is/hrbrmstr/attckr

Why

?

· FOSS
· Mission-built for Data Science
· Rich ecosystem for data analysis and visualization
· "Not Just R" · C/C++ · Python · Rust · Go · Java · Scala · Wasm ·...

{rmarkdown}
· Combine HTML, markdown, LaTeX and code (not just R code!) to create static or interactive reports.
· Can also work just like Jupyter Notebooks

R {shiny}
Create server-backed, highly dynamic reporting and data exploration applications that can be turned into standalone apps locally or served at scale on the internet.

What does the distribution of Tactics & Techniques look like? Where do we have technology gaps? Where do we have workforce gaps? Where should we invest our limited defense budget? How does X compare with Y? How does X compare with Y over time? What's the Dwell Time trend?
Photo by Jon Tyson on Unsplash

· fct_tactic: Make an ordered Tactics factor with optional better labelling · tactics_f: Tactics factors (generally for sorting & pretty-printing)
· validate_tactics: Validate Tactics strings against MITRE authoritative source · validate_technique_ids: Validate Technique IDs · validate_techniques: Validate Techniques strings against MITRE authoritative source
· attck_cdf_tactic: Product an ATT&CK Cumulative Distribution Function by Tactic · attck_map: Generate an ATT&CK heatmap · theme_enhance_atkmap: Remove cruft from ATT&CK heatmaps

What's Inside The Tin?
Validation Visualization

The following datasets are included: · enterprise_attack: Enterprise Attack Taxonomy v2.0 · mobile_attack: Mobile Attack Taxonomy v2.0 · pre_attack: Pre-Attack Taxonomy v2.0 · tactics_f: Tactics factors (generally for sorting & pretty-printing) · tidy_attack: Combined ATT&CK Matrices Tactics, Techniques and Technique detail

Data Source/Normalization https://github.com/mitre/cti/

+ ATT&CK Summary Reporting R Markdown Base Template & Real-world Data Sampled From Real Incident Distributions

[ { "first_event_ts": "2019-05-21 13:54:03", "first_alert_ts": "2019-05-21 13:54:03", "containment_ts": "2019-05-21 14:02:38", "org": "ac33b693", "mitre_attack": [ { "tactic": "Execution", "technique": "Third-Party Software", "id": "T1072" }, { "tactic": "Execution", "technique": "Third-Party Software", "id": "T1072" }, { "tactic": "Persistence", "technique": "BITS Jobs", "id": "T1197" }, { "tactic": "Execution", "technique": "Third-Party Software", "id": "T1072" },

{ "tactic": "Persistence", "technique": "BITS Jobs", "id": "T1197"
}, {
"tactic": "Execution", "technique": "Third-Party Software", "id": "T1072" } ], "industry": "Manufacturing" } ]

{attckr} v0.2.0
· Dwell time Metrics · ATT&CK Heatmaps · Cumulative ATT&CK Tactics Distributions

{attckr} v0.3.0
· More standard charts · ATT&CK Tactic + Technique event
timestamp support
· Functions and R Markdown template for
interactive charts
{attckr} v0.4.0
· 0 coding skills required Shiny App · {flexdashboard} R Markdown template
{attckr} v0.5.0
· ATT&CK Tactic + Technique Event
Stream Analysis & Visualization
Photo by Matt Duncan on Unsplash

@hrbrmstr research@rapid7.com
bob@rud.is https://rud.is/ https://github.com/hrbrmstr https://blog.rapid7.com/
Photo by Lip on Unsplash

