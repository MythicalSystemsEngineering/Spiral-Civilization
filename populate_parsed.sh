#!/usr/bin/env bash
set -euo pipefail

# 1. Ensure the directory exists
mkdir -p papers/parsed

# 2. Write each JSON file
cat > papers/parsed/arXiv_2308.12845.json << 'EOF'
{
  "paper_id": "arXiv:2308.12845",
  "title": "Implicit Obstacle Map-driven Indoor Navigation Model for Robust Obstacle Avoidance",
  "authors": ["Wei Xie","Haobo Jiang","Shuo Gu","Jin Xie"],
  "abstract": "Robust obstacle avoidance is one of the critical steps for successful goal-driven indoor navigation tasks. Visual image–based techniques still suffer from missed detections and unsatisfactory robustness. We propose a novel implicit obstacle map–driven framework, learning maps from historical trial-and-error rather than raw pixels. A non-local target memory aggregation module models relationships between target semantics and orientation clues, mining the most relevant object cues. Experiments on AI2-Thor and RoboTHOR demonstrate superior obstacle avoidance and navigation efficiency.",
  "keywords": ["indoor navigation","obstacle avoidance","implicit mapping","non-local networks"],
  "summary": [
    "Introduces an implicit obstacle map learned from past experiences instead of raw visual inputs.",
    "Designs a non-local memory aggregation module to link target semantics with orientation clues.",
    "Demonstrates improved navigation robustness on AI2-Thor and RoboTHOR benchmarks."
  ],
  "contributions": [
    "Novel framework for implicit obstacle mapping.",
    "Non-local target memory aggregation for efficient cue mining.",
    "Extensive empirical validation showing state-of-the-art obstacle avoidance."
  ]
}
EOF

cat > papers/parsed/arXiv_2508.14979.json << 'EOF'
{
  "paper_id": "arXiv:2508.14979",
  "title": "Energy-independent tomography of Gaussian states",
  "authors": ["Lennart Bittel","Francesco A. Mele","Jens Eisert","Antonio A. Mele"],
  "abstract": "We present an efficient, experimentally feasible Gaussian-state tomography algorithm with provable trace-distance recovery guarantees. Sample complexity depends only on the number of modes and is independent of photon number or energy up to doubly logarithmic factors. The core adaptive strategy systematically reduces total squeezing, yielding doubly exponential improvements. We also equip standard heterodyne tomography with rigorous trace-norm bounds.",
  "keywords": ["quantum tomography","Gaussian states","continuous variables","homodyne detection"],
  "summary": [
    "Develops an adaptive Gaussian-state tomography algorithm with trace-distance guarantees.",
    "Achieves sample complexity that is independent of energy up to log factors.",
    "Extends and rigorously bounds standard heterodyne tomography."
  ],
  "contributions": [
    "Energy-independent tomography protocol with provable recovery error.",
    "Adaptive squeezing reduction strategy.",
    "Improved theoretical bounds for heterodyne tomography."
  ]
}
EOF

cat > papers/parsed/arXiv_2102.06440.json << 'EOF'
{
  "paper_id": "arXiv:2102.06440",
  "title": "Interview Hoarding",
  "authors": ["Vikram Manjunath","Thayer Morrill"],
  "abstract": "In centralized matching markets like the NRMP, virtual interviews dramatically reduced costs for applicants but not for hospitals. We show that when doctors accept more interviews without programs increasing offers, no doctor benefits and many are harmed—a phenomenon we call interview hoarding. The excess interviews displace other applicants, worsening their outcomes. We prove this analytically and illustrate optimal mitigation for special cases, supported by simulations.",
  "keywords": ["matching markets","NRMP","interviews","market design"],
  "summary": [
    "Defines interview hoarding in centralized matching markets under virtual interviews.",
    "Proves that increased doctor interview capacity yields no benefit and potential harm.",
    "Uses simulations to extend analytic insights and explores mitigation strategies."
  ],
  "contributions": [
    "Formal identification of interview hoarding and its negative externality.",
    "Analytic proof characterizing when increased interviews harm participants.",
    "Simulation study and proposal of optimal mitigation approaches."
  ]
}
EOF

cat > papers/parsed/arXiv_2407.09231.json << 'EOF'
{
  "paper_id": "arXiv:2407.09231",
  "title": "Prompts First, Finally",
  "authors": ["Brent N. Reeves","James Prather","Paul Denny","Juho Leinonen","Stephen MacNeil","Brett A. Becker","Andrew Luxton-Reilly"],
  "abstract": "We argue that computer science education has always trended toward higher abstractions—culminating now in natural language via generative AI. Instead of banning AI, curricula should adopt a “prompts first” approach: teach prompt engineering as the opening programming abstraction. We trace this evolution and show that natural language is the culmination of programming abstractions, enabling more intuitive learner interaction.",
  "keywords": ["computer science education","generative AI","abstraction","prompt engineering"],
  "summary": [
    "Charts the historical progression of programming abstractions toward natural language.",
    "Argues for embracing generative AI and teaching prompt engineering first in CS courses.",
    "Positions “prompts first” as the next logical step in programming pedagogy."
  ],
  "contributions": [
    "Proposal of a “prompts first” curriculum model.",
    "Historical analysis of abstraction levels in CS education.",
    "Pedagogical case for integrating AI-driven natural language programming."
  ]
}
EOF

cat > papers/parsed/arXiv_2209.00022.json << 'EOF'
{
  "paper_id": "arXiv:2209.00022",
  "title": "Nodal higher-order topological superconductivity from a C4-symmetric Dirac semimetal",
  "authors": ["Zhenfei Wu","Yuxuan Wang"],
  "abstract": "We analyze possible superconducting instabilities emerging from a C4-symmetric Dirac semimetal. Odd-parity B1u and B2u pairing inherit topological obstructions, yielding four Bogoliubov–de Gennes Dirac-point nodes labeled by a Z2 monopole charge. In a rod geometry, gapped surfaces host higher-order Majorana arcs on hinges. Additional Z-valued charges protect these arcs against self-annihilation. Extensions to other pairing symmetries reveal stable “nodal cages” of bulk nodal lines.",
  "keywords": ["topological superconductivity","Dirac semimetal","higher-order topology","Majorana modes"],
  "summary": [
    "Identifies topological obstruction for B1u and B2u pairing in C4-symmetric Dirac semimetals.",
    "Shows protected higher-order Majorana hinge arcs in rod geometries.",
    "Extends classification to other symmetries, revealing nodal-line cages."
  ],
  "contributions": [
    "Proof of Z2 and Z monopole charges for BdG Dirac-point nodes.",
    "Prediction of higher-order Majorana arcs on sample hinges.",
    "Characterization of nodal cages under symmetry-preserving perturbations."
  ]
}
EOF

cat > papers/parsed/arXiv_2403.10123.json << 'EOF'
{
  "paper_id": "arXiv:2403.10123",
  "title": "Regularization-Based Efficient Continual Learning in Deep State-Space Models",
  "authors": ["Yuanhang Zhang","Zhidi Lin","Yiyong Sun","Feng Yin","Carsten Fritsche"],
  "abstract": "We introduce continual learning deep state-space models (CLDSSMs) that adapt to new tasks without catastrophic forgetting. Integrating mainstream regularization-based continual learning methods, CLDSSMs maintain constant computational and memory costs across tasks. We provide a detailed cost analysis and validate on real-world datasets, demonstrating superior performance over traditional DSSMs in parameter transfer and retention.",
  "keywords": ["continual learning","state-space models","regularization","deep learning"],
  "summary": [
    "Proposes CLDSSMs combining deep state-space models with regularization-based continual learning.",
    "Analyzes computational and memory costs of different CL strategies in CLDSSMs.",
    "Empirically shows CLDSSMs outperform standard DSSMs on real-world benchmarks."
  ],
  "contributions": [
    "Design of CLDSSMs that prevent catastrophic forgetting with bounded resource usage.",
    "Comprehensive cost analysis for regularization methods in continual learning.",
    "Experimental validation demonstrating improved multitask performance."
  ]
}
EOF

echo "JSON files created under papers/parsed/"
