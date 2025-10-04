FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    texlive-latex-recommended \
    texlive-latex-extra \
    texlive-fonts-recommended \
    texlive-fonts-extra \
    dvipng \
    texlive-base \
    texlive-pictures \
    cm-super \
    texlive-lang-cyrillic \
    texlive-xetex \
    chktex \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /workspace

CMD ["sh", "-c", "mkdir -p cv && pdflatex -interaction=nonstopmode main.tex && mv main.pdf cv/resume.pdf && rm -f *.aux *.log *.out .nojekyll"]