# math-constraint 


MathConstraint is a hard, massive, and easily-verifiable LLM benchmark for combinatorial, graph-based, and sat-based problems.

We draw problems from the pysms and pycsp libraries. 

We convert configurations of problems from our python libraries to natural language desciptions (perhaps using an LLM (e.g. gemini-flash)). We could verify these are valid descriptions by ensuring an LLM with access to the library api as a tool can easily solve them.

Our dataset consists of pairs of these english prompts and SAT/UNSAT verifiers. 

We evaluate on SOTA LLMs (and math tools like Aristotle) with and without tool-calling access -- e.g. give the LLM access to a generic SAT / CSP solver (not the library API because this is too easy) and it should still be hard, but the LLMs may perform better.

Further, we want to show that LLMs with tool calling saturate benchmarks like MathConstruct.

Moreover, we (later) wish to study whether reasoning paths to the solution are correct. Right reasoning and right answer > Wrong reasoning and right answer > wrong answer. (see recent NeurIPS workshop papers)