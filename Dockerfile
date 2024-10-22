# 베이스 이미지로 Python 3.10-slim 사용
FROM python:3.10-slim

# 필요한 시스템 패키지 설치
RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    git \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# 작업 디렉토리 설정
WORKDIR /app

# 파이썬 패키지 설치
COPY requirements.txt ./
RUN pip install --upgrade pip setuptools
RUN pip install --no-cache-dir -r requirements.txt

# 앱 코드 복사
COPY . .

# 서버 포트 열기
EXPOSE 7860

# Gradio 웹 애플리케이션 실행
CMD ["python", "-u", "app.py"]
