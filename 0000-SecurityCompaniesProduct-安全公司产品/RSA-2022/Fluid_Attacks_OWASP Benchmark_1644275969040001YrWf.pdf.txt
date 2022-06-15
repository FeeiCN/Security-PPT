OWASP Benchmark

What is the
OWASP Benchmark?
It is an initiative created by the Open Web Application Security Project (OWASP), a non-profit organization founded nearly 20 years ago, whose primary purpose is to improve software security. The OWASP Benchmark is a free Java test suite that, since 2015, has allowed us to evaluate the coverage, speed, and accuracy of automated vulnerability detection tools. It supports static (SAST), dynamic (DAST) and interactive application security testing (IAST) tools and helps us make objective comparisons between them before making a choice in the market or improving the machine we have been developing.

What does it evaluate?
The latest version of the OWASP Benchmark (v1.2) contains 2,740 test cases, of which 51.6% are actual exploitable vulnerabilities and the rest are false. These vulnerabilities are divided into 11 categories, corresponding to specific CWE numbers, which are as follows:

Command Injection (78*) Weak Cryptography (327) Weak Hashing (328) LDAP Injection (90)
(*CWE numbers)

Path Traversal (22) Secure Cookie Flag (614) SQL Injection (89) Trust Boundary Violation (501)

Weak Randomness (330) XPATH Injection (643) XSS (Cross-site Scripting) (79)

The OWASP Benchmark provides an expected results file for each category and test case that we can see at the end of the analysis. This allows us to verify whether each identified vulnerability is indeed real or not. Accordingly, the True Positive Rate (TPR) is the percentage of true vulnerabilities that the tool identifies. On the other hand, the False Positive Rate (FPR) is the percentage of false vulnerabilities that the tool reports as true. The ideal point is where we achieve a TPR of 100% and an FPR of 0%. From these values, we can calculate the Benchmark Accuracy Score ranging from 0 to 100, where 0 corresponds to insufficient accuracy and 100 to perfect accuracy.

Copyright © 2021 Fluid Attacks. We hack your software | info@fluidattacks.com | www.fluidattacks.com

What are Fluid Attacks' results?
At Fluid Attacks, we decided to test our custom tool against the OWASP Benchmark by applying the SAST technique (although it can also perform DAST). It achieved the highest Benchmark Score (i.e., 100) with a TPR of 100% and an FPR of 0%. In the following chart, published a few years ago by OWASP to compare open-source and commercial SAST tools, we took the liberty of including the current result of our tool:
{ } Our primary, customized tool achieved a Benchmark Score of 100, the highest value!
Copyright © 2021 Fluid Attacks. We hack your software | info@fluidattacks.com | www.fluidattacks.com

Additionally, in the next bar graph, we want to show you how our score compares to those of our competitors (scores at the top of the bars) who openly display their OWASP Benchmark results.

Fluid

Contrast

Attacks Assess

100 100

Kiuwan Code Security
83

WhiteHat Sentinel Source vSE
77

ShiftLeft
74

DefenseCode ThunderScan

WhiteHat Sentinel Source vEE

46

42

Score = TPR - FPR (without percentage symbol)

TPR: 100% FPR: 0%

TPR: 100% FPR: 0%

TPR: 100% FPR: 17%

TPR: 78% FPR: 1%

TPR: 100% FPR: 26%

TPR: 78% FPR: 32%

TPR: 78% FPR: 36%

In all cases, the companies used SAST tools. Some of the score values we provide are approximate, and we compiled them from the following sources in August 2021 (ordered from left to right according to the graph): Contrast, Kiuwan, WhiteHat, SB (ShiftLeft), DefenseCode, and WhiteHat.

We are very proud to have achieved this goal, but we recognize this as only one reference source to optimize our tool. In fact, we consider fundamental the feedback we constantly get from real applications. If you want to learn more about our tool's success, please visit this blog post. And if you wish to prove for yourself the authenticity of our results, please follow this guide.
Finally, remember that although you can indeed take advantage of automatic tools to find vulnerabilities quickly, it will always be better to perform a comprehensive analysis with the additional manual work of ethical hackers to discover more complex security issues in your systems. For more information about this recommended solution, please do not hesitate to contact us.

Copyright © 2021 Fluid Attacks. We hack your software | info@fluidattacks.com | www.fluidattacks.com

