# 📁 Estrutura do Projeto ByteStore

## Visão Geral
ByteStore é uma aplicação Laravel com stack moderna: **Laravel 11**, **Tailwind CSS v4**, **Vite** e **Docker Compose**.

---

## 📂 Estrutura de Diretórios

```
ByteStore/
├── 📦 app/                          # Código da aplicação Laravel
│   ├── Http/
│   │   ├── Controllers/            # Controladores HTTP
│   │   └── ...
│   ├── Models/
│   │   ├── User.php                # Model de usuário
│   │   └── ...
│   ├── Providers/
│   │   ├── AppServiceProvider.php  # Service Provider da aplicação
│   │   └── ...
│   └── ...
│
├── 📦 bootstrap/                     # Arquivos de inicialização
│   ├── app.php                      # Inicialização da aplicação
│   ├── providers.php                # Registro de providers
│   └── cache/
│       ├── packages.php
│       └── services.php
│
├── 📦 config/                        # Arquivos de configuração
│   ├── app.php                      # Config da aplicação
│   ├── auth.php                     # Config de autenticação
│   ├── cache.php                    # Config de cache
│   ├── database.php                 # Config de banco de dados
│   ├── filesystems.php              # Config de armazenamento
│   ├── logging.php                  # Config de logs
│   ├── mail.php                     # Config de email
│   ├── queue.php                    # Config de filas
│   ├── services.php                 # Config de serviços
│   └── session.php                  # Config de sessão
│
├── 📦 database/                      # Banco de dados
│   ├── factories/
│   │   └── UserFactory.php          # Factory para testes
│   ├── migrations/
│   │   ├── 0001_01_01_000000_create_users_table.php
│   │   ├── 0001_01_01_000001_create_cache_table.php
│   │   └── 0001_01_01_000002_create_jobs_table.php
│   └── seeders/
│       └── DatabaseSeeder.php       # Seeder principal
│
├── 📦 public/                        # Raiz pública (acessível externamente)
│   ├── index.php                    # Ponto de entrada da aplicação
│   ├── robots.txt
│   ├── hot                          # Arquivo de HMR do Vite
│   └── build/
│       ├── manifest.json            # Manifesto de assets compilados
│       └── assets/                  # Assets compilados (CSS, JS)
│
├── 📦 resources/                     # Recursos (views, CSS, JS)
│   ├── css/
│   │   └── app.css                  # CSS principal (Tailwind)
│   ├── js/
│   │   └── app.js                   # JS principal
│   └── views/
│       └── welcome.blade.php        # View de boas-vindas
│
├── 📦 routes/                        # Definições de rotas
│   ├── console.php                  # Rotas de console
│   └── web.php                      # Rotas web
│
├── 📦 storage/                       # Armazenamento de dados
│   ├── app/
│   │   ├── private/                 # Arquivos privados
│   │   └── public/                  # Arquivos públicos
│   ├── framework/
│   │   ├── cache/                   # Cache da framework
│   │   ├── sessions/                # Sessões
│   │   ├── testing/                 # Testes
│   │   └── views/                   # Views compiladas
│   └── logs/                        # Logs da aplicação
│
├── 📦 tests/                         # Testes
│   ├── TestCase.php                 # Caso de teste base
│   ├── Feature/
│   │   └── ExampleTest.php
│   └── Unit/
│       └── ExampleTest.php
│
├── 📦 vendor/                        # Dependências do Composer (não editar)
│   ├── autoload.php
│   ├── bin/
│   ├── composer/
│   └── ... (bibliotecas PHP)
│
├── 📄 .env                           # Variáveis de ambiente (local)
├── 📄 .env.example                   # Template de variáveis de ambiente
├── 📄 .editorconfig                  # Configuração do editor
├── 📄 .gitattributes                 # Atributos Git
├── 📄 .gitignore                     # Arquivos ignorados pelo Git
├── 📄 .npmrc                         # Configuração do NPM
│
├── 🐳 docker-compose.yml             # Orquestração de containers
├── 🐳 Dockerfile                     # Definição da imagem Docker
├── 📄 nginx.conf                     # Configuração do Nginx
│
├── 📄 artisan                        # CLI do Laravel
├── 📄 composer.json                  # Dependências PHP
├── 📄 composer.lock                  # Lock file do Composer
│
├── 📄 package.json                   # Dependências Node.js
├── 📄 package-lock.json              # Lock file do npm
│
├── 📄 vite.config.js                 # Configuração do Vite
├── 📄 tailwind.config.js             # Configuração do Tailwind CSS
│
├── 📄 phpunit.xml                    # Configuração do PHPUnit
├── 📄 README.md                      # Documentação do projeto
├── 📄 DOCKER_FIXES.md                # Notas sobre correções Docker
├── 📄 rebuild.sh                     # Script de rebuild
└── 📄 ESTRUTURA_PROJETO.md           # Este arquivo
```

---

## 🚀 Serviços Docker

### 1. **app** (PHP-FPM)
- Container principal com PHP 8.3-FPM
- Porta: 9000
- Conecta ao banco de dados MySQL
- Instala dependências do Composer

### 2. **nginx** (Web Server)
- Nginx Alpine
- Porta: 8080 (acesso via http://localhost:8080)
- Proxies requisições para o PHP-FPM

### 3. **db** (MySQL)
- MySQL 8.0
- Porta: 3306
- Banco: `bytestore`
- Usuário: `bytestore` / Senha: `12345678`

### 4. **vite** (Dev Server)
- Node.js 20
- Porta: 5173 (HMR - Hot Module Replacement)
- Executa `npm run dev` para desenvolvimento
- Compila assets em tempo real

---

## 📝 Dependências Principais

### PHP (Backend)
- Laravel 11
- Laravel Vite Plugin
- Composer

### Node.js (Frontend)
- Vite 8
- Tailwind CSS v4
- Laravel Vite Plugin
- Concurrently

---

## 🛠️ Comandos Úteis

### Desenvolvimento

```bash
# Iniciar desenvolvimento com Docker
docker-compose up -d

# Ver logs em tempo real
docker-compose logs -f

# Executar migrações
docker exec bytestore_app php artisan migrate

# Criar nova migration
docker exec bytestore_app php artisan make:migration nome_da_migration

# Criar novo modelo
docker exec bytestore_app php artisan make:model NomeDoModelo

# Criar novo controlador
docker exec bytestore_app php artisan make:controller NomeDoControlador

# Listar rotas
docker exec bytestore_app php artisan route:list
```

### Build & Deploy

```bash
# Build para produção (sem Docker)
npm run build

# Dev com watch (sem Docker)
npm run dev

# Composer install
composer install

# Composer update
composer update
```

### Docker

```bash
# Parar containers
docker-compose down

# Recriar containers
docker-compose up --build

# Remover volumes (cuidado!)
docker-compose down -v
```

---

## 🎨 Stack Técnico

| Camada | Tecnologia | Versão |
|--------|-----------|--------|
| **Backend** | Laravel | 11 |
| **Runtime Backend** | PHP-FPM | 8.3 |
| **Banco de Dados** | MySQL | 8.0 |
| **Web Server** | Nginx | Alpine |
| **Frontend Build** | Vite | 8 |
| **CSS Framework** | Tailwind CSS | 4 |
| **Runtime Frontend** | Node.js | 20 |
| **Orquestração** | Docker Compose | 3.8 |

---

## 🔧 Configurações Chave

### Variáveis de Ambiente (.env)
- `APP_ENV=local` - Ambiente de desenvolvimento
- `APP_DEBUG=true` - Debug ativado
- `APP_URL=http://localhost:8080` - URL da aplicação
- Banco de dados: MySQL no Docker

### Vite (vite.config.js)
- HMR em `localhost:5173`
- Input: `resources/css/app.css` e `resources/js/app.js`
- Refresh automático de views Blade

### Tailwind CSS (tailwind.config.js)
- Content: Views Blade, JS e PHP da app
- Tema customizado com fonte 'Instrument Sans'

---

## 📦 Estrutura de Assets

```
resources/
├── css/
│   └── app.css              # @import 'tailwindcss' + configurações
├── js/
│   └── app.js               # Entry point do JS
└── views/
    └── welcome.blade.php    # @vite(['resources/css/app.css', 'resources/js/app.js'])
```

Quando em desenvolvimento:
- Vite injeta os arquivos via HMR em `http://localhost:5173`
- Mudanças em CSS/JS são refletidas em tempo real

Quando em produção:
- Assets são compilados para `public/build/`
- Manifesto gerado em `public/build/manifest.json`

---

## 📱 URLs de Acesso

| Serviço | URL | Descrição |
|---------|-----|-----------|
| **Aplicação** | http://localhost:8080 | Web app via Nginx |
| **Vite Dev** | http://localhost:5173 | HMR e dev assets |
| **MySQL** | localhost:3306 | Banco de dados |
| **PHP-FPM** | localhost:9000 | Servidor PHP (interno) |

---

## 🚨 Troubleshooting

### CSS não carrega
1. Verificar se `@vite()` está na view
2. Confirmar se Vite está rodando (`docker-compose logs vite`)
3. Limpar navegador cache

### Vite não conecta
1. Verificar porta 5173: `lsof -i :5173`
2. Reiniciar container: `docker-compose restart vite`

### Banco não conecta
1. Verificar se MySQL está rodando: `docker-compose ps`
2. Credenciais no `.env`

---

## 📚 Próximos Passos

1. ✅ Configurar variáveis de ambiente (.env)
2. ✅ Iniciar containers: `docker-compose up -d`
3. ✅ Migrar banco: `docker exec bytestore_app php artisan migrate`
4. ✅ Acessar: http://localhost:8080

---

**Última atualização:** 25/05/2026
**Versão:** 1.0
