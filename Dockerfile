FROM ubuntu:22.04

# Устанавливаем режим noninteractive для apt
ENV DEBIAN_FRONTEND=noninteractive

# Обновляем пакеты и устанавливаем необходимые LaTeX зависимости
RUN apt-get update && apt-get install -y \
    texlive \
    texlive-latex-recommended \
    texlive-latex-extra \
    texlive-fonts-recommended \
    texlive-fonts-extra \
    texlive-base \
    texlive-pictures \
    texlive-lang-cyrillic \
    texlive-xetex \
    latexmk \
    dvipng \
    cm-super \
    && rm -rf /var/lib/apt/lists/*

# Устанавливаем рабочую директорию
WORKDIR /resume

# Копируем исходные файлы
COPY . .

# Создаем папку для финального резюме
RUN mkdir -p /resume/cv

# Команда для сборки резюме и перемещения готового PDF
CMD ["sh", "-c", "latexmk -pdf -interaction=nonstopmode main.tex && mv main.pdf cv/resume.pdf"]
