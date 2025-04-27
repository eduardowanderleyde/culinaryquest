# CulinaryQuest

Uma plataforma gamificada para aprender a cozinhar.

## Tecnologias

- Ruby on Rails 7.1
- PostgreSQL
- Tailwind CSS
- Hotwire/Turbo
- Devise para autenticação

## Configuração Local

1. Clone o repositório
2. Instale as dependências:

   ```bash
   bundle install
   yarn install
   ```

3. Configure o banco de dados:

   ```bash
   rails db:create db:migrate
   ```

4. Inicie o servidor:

   ```bash
   ./bin/dev
   ```

## Deploy

O projeto está configurado para deploy no Render. Para fazer o deploy:

1. Crie uma conta no [Render](https://render.com)
2. Conecte seu repositório GitHub
3. Crie um novo Web Service
4. Selecione o repositório
5. Use as seguintes configurações:
   - Environment: Ruby
   - Build Command: `./bin/render-build.sh`
   - Start Command: `bundle exec puma -C config/puma.rb`
6. Adicione as variáveis de ambiente:
   - `RAILS_MASTER_KEY` (obtenha do arquivo `config/master.key`)
   - `RAILS_ENV=production`
   - `RAILS_SERVE_STATIC_FILES=true`

## Licença

MIT
