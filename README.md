```markdown
# React Multi-Environment Deployment with AWS CodePipeline

This project demonstrates how to deploy a single React app to multiple environments (`dev`, `staging`, `prod`) using **one shared pipeline** with dynamic configuration.


## Key Features

- Single `buildspec.yml` for all environments  
- Dynamic `appspec.yml` generated from a template  
- Custom NGINX routing per environment  
- Lifecycle scripts handled by CodeDeploy  

---

## Project Structure



.
├── buildspec.yml
├── appspec.template.yml
├── scripts/
│   ├── generate\_appspec.sh
│   ├── install\_dependencies.sh
│   ├── stop\_server.sh
│   ├── start\_server.sh
│   └── validate\_service.sh
├── public/
├── src/
└── ...
```
````

---

## Build & Deployment

**Environment Variables Required:**
- `REACT_APP_ENV` → `dev`, `staging`, or `prod`
- `BUILD_ENV` → used for `appspec` path substitution

### `buildspec.yml`

```yaml
version: 0.2
phases:
  install:
    runtime-versions:
      nodejs: 18
    commands:
      - npm install
  build:
    commands:
      - npm run ${REACT_APP_ENV}-build
      - chmod +x scripts/*.sh
      - scripts/generate_appspec.sh
artifacts:
  files:
    - build/**/*
    - appspec.yml
    - scripts/**/*
````

### `package.json` Scripts

```json
"scripts": {
  "dev-build": "REACT_APP_ENV=dev PUBLIC_URL=/dev react-scripts build",
  "staging-build": "REACT_APP_ENV=staging PUBLIC_URL=/staging react-scripts build",
  "prod-build": "REACT_APP_ENV=prod PUBLIC_URL=/prod react-scripts build"
}
```

### `generate_appspec.sh`

Generates `appspec.yml` using env-based substitution:

```bash
sed "s|\${BUILD_ENV}|$BUILD_ENV|g" appspec.template.yml > appspec.yml
```

---

## NGINX Config (Example)

```nginx
location ^~ /prod/ {
  alias /var/www/prod/public_html/;
  try_files $uri $uri/ /index.html;
}
# Same for /staging/ and /dev/
```

---

## Deployment Flow

1. CodePipeline triggers on branch push
2. CodeBuild sets `REACT_APP_ENV` and `BUILD_ENV`
3. React is built and deployed to `/var/www/<env>/public_html`
4. NGINX serves it at `/<env>/`

---

## Example UI Output

```
Welcome to Pawan's Demo for AWS CodePipeline
Current Environment: staging
```

---
```
