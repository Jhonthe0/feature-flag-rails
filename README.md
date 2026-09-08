# Feature Flag Rails

Projeto Rails simples para demonstrar feature flags em aula.

## Demo

- `/checkout`: mostra o checkout atual ou o novo checkout conforme a flag.
- `/feature_flags`: liga/desliga `new_checkout` e ajusta o percentual de rollout.

## Como rodar

```bash
bundle install
bin/rails server
```

Abra `http://localhost:3000`.

## Roteiro sugerido

1. Comece com `new_checkout` desligada e rollout em `0%`.
2. Mostre que o código do novo checkout existe, mas o usuário recebe o fluxo atual.
3. Ligue a flag com rollout em `100%` e volte para `/checkout`.
4. Simule um problema e desligue a flag como kill switch.
5. Ligue novamente com rollout parcial, por exemplo `20%`, e altere o cliente na tela de checkout.
