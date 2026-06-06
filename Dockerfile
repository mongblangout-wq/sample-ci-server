# 1. 베이스 이미지로 가벼운 Node.js 환경 선택
FROM node:20-alpine

# 2. 컨테이너 내부 작업 디렉토리 설정
WORKDIR /app

# 3. 패키지 설치 파일들을 먼저 복사
COPY package*.json yarn.lock* ./

# 4. 의존성 패키지 설치
RUN yarn install --production || npm install --production

# 5. 나머지 소스코드 전체 복사
COPY . .

# 6. 애플리케이션이 사용할 3000번 포트 명시
EXPOSE 3000

# 7. 서버 실행 명령어 (교재 p.27 참고)
CMD ["node", "src/index.js"]