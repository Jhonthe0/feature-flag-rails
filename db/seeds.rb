products = [
  ["Caderno universitario", "Capa dura com 160 folhas para anotacoes da aula.", 2490, "#a7c7e7"],
  ["Caneta gel preta", "Escrita macia para rascunhos e provas.", 690, "#2f3a45"],
  ["Marca-texto amarelo", "Destaque pontos importantes do roteiro.", 790, "#f6d65b"],
  ["Mochila compacta", "Espaco para notebook, livros e carregador.", 12990, "#6f8f72"],
  ["Garrafa termica", "Mantem cafe ou agua gelada durante a apresentacao.", 5990, "#d96f32"],
  ["Mouse sem fio", "Controle a demo com mais conforto.", 4490, "#8f6fb4"],
  ["Teclado compacto", "Layout simples para codar durante a aula.", 8990, "#3f6f8f"],
  ["Suporte para notebook", "Melhora a postura em aulas e reunioes.", 7490, "#c78b65"],
  ["Fone de ouvido", "Audio limpo para estudar ou gravar explicacoes.", 11990, "#5d6861"],
  ["Planner semanal", "Organize deploy, release e rollout.", 3490, "#d7a84f"],
  ["Post-it colorido", "Mapeie ideias e riscos antes do release.", 1290, "#f2a7b8"],
  ["Hub USB-C", "Conecte projetor, mouse e pendrive.", 9990, "#607d8b"],
  ["Cabo HDMI", "Leve a demo para o projetor da sala.", 2990, "#444444"],
  ["Luminaria de mesa", "Iluminacao para estudar sem cansar.", 8490, "#f1c27d"],
  ["Calculadora simples", "Calcule desconto, subtotal e total.", 2590, "#4d908e"],
  ["Estojo organizador", "Guarde cabos, canetas e adaptadores.", 1990, "#b56576"],
  ["Livro de arquitetura", "Referencia para decisoes tecnicas melhores.", 8990, "#6d597a"],
  ["Quadro branco pequeno", "Desenhe fluxos de rollout e rollback.", 6990, "#edf2f4"],
  ["Adaptador tomada", "Evite depender da sala estar preparada.", 1890, "#e9c46a"],
  ["Pasta de documentos", "Guarde roteiro, slides e anotacoes.", 1590, "#2a9d8f"]
]

products.each do |name, description, price_cents, image_color|
  Product.find_or_create_by!(name:) do |product|
    product.description = description
    product.price_cents = price_cents
    product.image_color = image_color
  end
end

User.find_or_create_by!(email: "aluno@example.com") do |user|
  user.name = "Aluno Demo"
  user.password = "password123"
  user.password_confirmation = "password123"
end
