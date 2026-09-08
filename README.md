# Feature Flag Rails

Projeto Rails simples para demonstrar feature flags em aula usando uma loja
ficticia.

## Demo

- `/`: lista 20 produtos genericos.
- `/users/sign_in`: login simples com Devise.
- `/cart`: carrinho de compras protegido por login.
- `COUPONS_ENABLED`: feature flag por variavel de ambiente que habilita cupons.

## Como rodar

Com Ruby local:

```bash
bundle install
bin/rails db:setup
bin/rails server
```

Abra `http://localhost:3000`.

Login demo criado pelo seed:

- email: `aluno@example.com`
- senha: `password123`

Com Docker:

```bash
docker compose up --build
```

Abra `http://localhost:3000`.

Para demonstrar a flag desligada:

```bash
COUPONS_ENABLED=false docker compose up --build
```

Para demonstrar a flag ligada:

```bash
COUPONS_ENABLED=true docker compose up --build
```

Cupons validos: `AULA10` e `FLAGS20`.

## Roteiro sugerido

1. Rode a aplicacao com `COUPONS_ENABLED=false`.
2. Faça login, adicione produtos e mostre que o carrinho nao oferece cupom.
3. Explique que o codigo de cupom ja existe no deploy.
4. Reinicie com `COUPONS_ENABLED=true`.
5. Aplique `AULA10` ou `FLAGS20` no carrinho e mostre o desconto.
6. Simule problema no cupom e volte para `COUPONS_ENABLED=false`.
