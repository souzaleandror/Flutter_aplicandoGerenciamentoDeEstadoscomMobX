#### 24/11/2023

Curso de Flutter: aplicando gerenciamento de estados com MobX

@01-Gerenciamento de estados em Flutter 

@@01
Apresentação

Boas-vindas! Sou Matheus Alberto, instrutor da Escola de Mobile na Alura.
Autodescrição: Sou um homem branco de cabelos castanhos escuros curtos. Tenho olhos castanhos escuros e estou com a barba feita. Estou vestindo uma camiseta azul escura. Ao fundo, há uma parede lisa azul clara.
O que vamos aprender?
Neste curso, vamos desenvolver um aplicativo de delivery chamado Panucci Delivery. Nele, podemos adicionar itens na sacola de compras e conferir o valor total na parte inferior da tela. Clicando no botão "Ver carrinho", seremoss redirecionados para a página de checkout, onde é possível validar os itens escolhidos e finalizar o pedido.

Trabalharemos com gerenciador de estados MobX. Estudaremos conceitos como actions e observables (observáveis). Também aprendemos como recuperar as informações dos observáveis e transportá-los para toda nossa aplicação, utilizando provider.

Gerenciadores de estado são muito utilizados no mercado de trabalho, porque facilitam bastante o processo de lidar com variáveis e objetos mutáveis que precisam ter algum tipo de reflexo na parte visual da aplicação. Por exemplo, caso um valor seja atualizado e precisemos de uma ação refletida na tela, os gerenciadores de estado são uma ótima ferramenta para facilitar esse trabalho.

Pré-requisito
O único pré-requisito para este curso é que você tenha conhecimento de gerenciadores de estado com provider. É interessante saber como passar informações de provider com as telas, principalmente com relação ao context.

Espero ter despertado seu interesse! Te convido para participar dessa aventura comigo. Vamos mergulhar nesse mar de conhecimento?

@@02
Preparando o ambiente

Olá, Dev!
Matheus por aqui!

Você está iniciando seu mergulho no curso sobre Flutter: aplicando gerenciamento de estados com MobX!

Vamos preparar o ambiente baixando o projeto?

1) Baixando o projeto
Neste curso, vamos implementar funcionalidades importantes no projeto Panucci Delivery.

Para seguir com seus estudos, siga os passos a seguir, conforme as instruções.

2) Do que preciso para rodar o projeto?
Ter uma IDE, que pode ser o Android Studio, instalada na sua máquina;
Ter a SDK do Flutter na versão 3.7.1.
3) O que vou aprender neste curso?
Vamos aprofundar nossos conhecimentos e habilidades em um popular gerenciador de estados: o MobX! Isso é muito importante pois, conforme nossa aplicação cresce, precisamos lidar com os dados e passar informações entre telas de forma mais otimizada e que facilite o processo de desenvolvimento!

Também, o MobX é bastante requisitado pelas empresas.

4) Como fazer este curso?
Durante sua jornada, você encontrará atividades práticas e teóricas para testar seus conhecimentos, material extra para se aprofundar nos seus estudos, e desafios para praticar suas habilidades.

Vamos ver dicas para fazer bem este curso?

Levante a mão e participe! Tudo bem se não conseguir realizar alguma atividade, isso faz parte do processo. Procure o fórum ou nossa comunidade no Discord e aproveite para tirar dúvidas, para interagir com outras pessoas e ajudar um colega (ensinar é uma ótima forma de aprender);
Pratique! Faça, teste, replique as atividades sinalizadas pelo instrutor, pois assim ganhará confiança e fixará melhor o conteúdo;
Foque, mas descanse! Caso sinta-se cansado(a) ou não esteja entendendo algo, dê uma pausa, tome uma água, e depois assista novamente as videoaulas;
O importante é persistir até o fim! Preparado(a)? Podemos começar.

Bons estudos!

Um abraço,

Matheus Alberto

https://github.com/alura-cursos/2965-gerenciamento-de-estados-mobx/archive/refs/heads/main.zip

@@03
Conhecendo o projeto

É importante que, neste momento do curso, você já tenha baixado os arquivos do projeto. Caso não tenha feito isso ainda, recomenda-se voltar à atividade anterior e baixar os arquivos antes de prosseguir.
Depois de baixados e extraídos em uma pasta, vamos conferir como é a estrutura do projeto em uma IDE. No caso, estou usando o Visual Studio Code, mas você pode utilizar a de sua preferência. Executando o arquivo main.dart (na pasta "lib"), podemos conferir no emulador como está o projeto atualmente.

Tela inicial
No topo da tela, há um campo de busca. Na parte central da tela, há três categorias. De cima para baixo, são elas: "Mais comprados", "Para o almoço" e "Para dividir". Abaixo de cada categoria, há cartões de produtos dispostos horizontalmente. Cada cartão contém uma imagem, o nome do produto, um valor em reais e a quantidade adicionada ao carrinho (por padrão, zero). Na parte inferior, há um botão vermelho escrito "Ver carrinho" no centro. Na parte esquerda do botão, há um ícone de cesta com o número de itens no carrinho. Na parte direita, há o valor total em reais.

O que cada um dos componentes na tela representa está dentro da pasta "lib", em que temos as subpastas:

components (componentes)
models (modemos)
screens (telas)
Além disso, temos um arquivo chamado cardapio.dart, que contém todas as informações necessárias para preencher as listas de cada categoria da aplicação, como "Mais comprados", "Para o almoço" e "Para dividir". Dentro dessas listas, temos os nomes de cada um dos cartões, a qual categoria ela pertence, qual seu valor e a URL da imagem.

O componente mais importante com o qual vamos trabalhar é o cartao.dart, porque ele engloba toda a estrutura da imagem, do nome do produto, do preço e do contador, que é um componente separado cuja única responsabilidade é adicionar e remover itens do carrinho de compras.

A estrutura do arquivo contador.dart é bem simples. Temos o botão de remover, o texto que indica a quantidade e o botão de adicionar. Atualmente, esses botões não estão funcionais. Vamos trabalhar neles ao longo do curso.

Ao adicionar ou remover itens do carrinho, queremos mostrar a quantidade de itens e o valor total da compra na parte de baixo da tela. Esse componente está no final do arquivo home.dart, na pasta "screens".

Ele recebe a quantidade de itens na sacola, exibe o texto "Ver carrinho" e também mostra o valor total da compra. Trata-se de funcionalidades que também implementaremos no curso.

Tela de checkout
Ao clicar no botão "Ver carrinho" na parte inferior, a pessoa usuária será direcionada para a página de checkout. Como nós ainda não implementamos a navegação, não conseguiremos acessá-la pelo emulador agora, mas podemos conferir seu leiaute no Figma.

Na tela de checkout, temos a seção "Pedido" com a lista de itens adicionados no carrinho. Em seguida, temos a seção "Pagamento", em que é possível selecionar um cartão. Depois, temos a seção "Confirmar", com o valor final da compra. Na parte inferior, há um botão vermelho escrito "Pedir". Todos esses componentes estão na pasta "components" e no arquivo checkout.dart (na pasta "screens").

É importante que você tenha o Flutter na versão 3.7.1. No arquivo pubspec.yaml, a partir da linha 30, temos as seguintes dependências:

Mobx 2.1.3+1
Flutter_mobx 2.0.6+5
Provider 6.0.5
A partir da linha 42, temos as seguintes dependências de desenvolvimento:

build_runner 2.3.3
mobx_codegen 2.1.1
É necessário que você tenha todas essas dependências nas versões mencionadas nesse arquivo. A IDE provavelmente as baixará automaticamente, mas, caso não faça, basta abrir o terminal e rodar o seguinte comando:

flutter pub getCOPIAR CÓDIGO
Feito isso, podemos seguir com o nosso projeto.

@@04
Estados com setState

Vamos começar fazendo o nosso cartão adicionar itens na sacola, então trabalharemos no componente de contador. No arquivo contador.dart, temos duas funções: adição e remoção de itens.
Já que queremos alterar um valor que será refletido depois na tela, vamos usar um StatefulWidget. Portanto, na linha 3, vamos converter o StatelessWidget para o StatefulWidget:

class Contador extends StatefulWidgetCOPIAR CÓDIGO
Agora, precisamos de algum lugar para guardar as informações de quantidade de itens selecionados. Dentro do contador, vamos criar uma variável do tipo inteiro chamada valorContador, inicializada com o valor zero:

// ...

class _ContadorState extends State<Contador> {
  int valorContador = 0;

// ...COPIAR CÓDIGO
Toda vez que quisermos fazer uma alteração nessa variável e ela ser refletida na aplicação, o primeiro passo é mostrá-la na tela. Atualmente, na linha 24, temos um Text com valor fixo igual a 0 em string. Alteraremos esse valor para utilizar a variável valorContador:

// ...

Text(valorContador.toString())

// ...COPIAR CÓDIGO
Como o Text só recebe textos, usamos o método toString() para converter o número inteiro em string. Podemos salvar as alterações e notaremos que a aplicação continua funcionando.

Botão de remoção
O primeiro botão é responsável pela remoção de um item. Para alterar o valor da variável e espelhá-lo na tela, dentro de onTap(), usaremos a função setState(). Como estamos subtraindo do contador, colocaremos valorContador--:

// ...

InkWell(
    borderRadius: BorderRadius.circular(20),
    onTap: () {
        setState(() {
                valorContador--;
        });
    },
    child: const Icon(Icons.remove_circle_outline, size: 20,),
),

// ...COPIAR CÓDIGO
O valor inicial é zero e não pretendemos usar números negativos. Então, vamos inserir uma estrutura if para garantir que esse botão só funcionará se o valor for maior que zero:

// ...

InkWell(
    borderRadius: BorderRadius.circular(20),
    onTap: () {
        setState(() {
                if(valorContador > 0) {
                        valorContador--;
                }
        });
    },
    child: const Icon(Icons.remove_circle_outline, size: 20,),
),

// ...COPIAR CÓDIGO
Ao salvar as alterações, notaremos que a aplicação continua funcionando.

Botão de adição
No segundo botão, vamos desenvolver a lógica para adicionar um item ao carrinho. Similarmente ao anterior, usaremos a função setState() com valorContador++:

// ...

InkWell(
    borderRadius: BorderRadius.circular(20),
    onTap: () {
        setState(() {
                valorContador++;
        });
    },
    child: const Icon(Icons.add_circle_outline, size: 20,),
),

// ...COPIAR CÓDIGO
Vamos salvar e testar. No emulador, ao clicar nos botões de remoção e adição de um produto, o número do contador será atualizado na tela.

Limitações da aplicação
Por enquanto, conseguimos trabalhar usando o StatefulWidget. No entanto,encontraremos algumas limitações na nossa aplicação. Por exemplo, o valor do contador está sendo utilizado apenas dentro do widget de contador. Ele apenas modifica o número exibido, mas não insere um item no carrinho nem altera a lista de compras, de fato.

Além disso, as funções de remoção e adição simplesmente incrementam ou decrementam um valor, a partir do próprio botão que é acessível apenas dentro do contador. E se quisermos acessar essa função em outros lugares da aplicação para alterar a quantidade de um item?

Não bastasse, os valores que aparecem na parte inferior da tela são globais, que devem ser acessíveis de qualquer lugar a aplicação. Ao adicionar um item na sacola, por exemplo, tanto a quantidade de itens quanto o valor total em reais deveria ser modificado.

E como passamos todos esses valores para outras telas? Na página de checkout, temos uma lista de tudo que pretendemos comprar, bem como o valor total do carrinho.

Com o Flutter, conseguimos resolver essas questões com InheritedWidget e até mesmo com StatefulWidget. Contudo, à medida que aplicação fica mais complexa, torna-se difícil manter o controle de onde utilizaremos cada função e como passamos informações de um widget a outro de maneira consistente e evitando problemas de duplicidade.

Uma forma melhor de lidar com todos esses problemas é o uso de gerenciadores de estados. Eles lidam com todos os estamos de várias partes da aplicação, assim temos um controle mais tranquilo e agradável. No próximo vídeo, aprenderemos sobre esse assunto.

@@05
setState

Em um app, geralmente vamos precisar alterar valores e atualizá-los na tela, por exemplo:
Um “carrinho” ou “sacola” de um app de delivery ou qualquer site de compras;
2965-img-1-gif-aula-1.gif

Um filtro de produtos em uma aplicação de controle de estoque.
Para resolver esse desafio, podemos utilizar várias abordagens. Em geral, alterar valores do Flutter é simples - podemos fazer isso com o Stateful widget e o setState.

Escolha as alternativas que melhor representam as limitações de usar Stateful widgets com setState():

Apenas utilizando funcionalidades nativas do Flutter, não existe uma maneira de lidar com estados globais da aplicação.
 
Alternativa correta
Pensando em valores globais (valores que precisam ser acessados em toda a aplicação), apenas Stateful widgets e o setState geram uma enorme dependência entre widgets, precisando passar cada valor dentro do construtor de cada widget da árvore de widgets.
 
Uma opção nativa para lidar com valores globais é o Inherited widget.
Alternativa correta
Podemos acessar funções que alteram valores apenas dentro do Stateful widget. Se tivermos um modelo de contador, não podemos acessar esses valores, pois o acesso fica restrito apenas dentro do modelo.
 
Alternativa correta
Com Stateful widgets, nós não conseguimos redesenhar partes específicas do código (ex. onde a variável que terá o valor atualizado está). Todo o widget será redesenhado, perdendo performance se o widget for muito complexo.
 
Exatamente! Por padrão, com o Stateful widget, nós não temos esse controle preciso das partes que serão redesenhadas na tela. Isso, no decorrer do desenvolvimento do projeto, pode causar problemas de performance, pois redesenhar a tela do app, por inteiro, é uma ação custosa para o processador, prejudicando o rendimento dos dispositivos móveis.

@@06
Para saber mais: gerenciadores de estado

No projeto Panucci Delivery, temos uma missão: criar um botão de contador que aumenta ou diminui a quantidade de um produto (um chicken salad, por exemplo).
2965-img-1-gif-aula-1.gif

Tentamos, primeiramente, a abordagem com o setState, porém identificamos problemas relevantes e constatamos que a solução mais eficiente é utilizar um gerenciador de estado.

O que é um estado e o tal gerenciador?
Se você perceber, um aplicativo está constantemente mudando: navegamos de uma tela para outra, alteramos valores de produtos, a tela é redesenhada conforme escrevemos textos. Então, com aplicativos, a mudança e impermanência são a regra básica de funcionamento.

Como você deve perceber, lidar com a constante mudança e alterações na tela é bastante trabalhoso. Para lidar com essas mudanças de forma otimizada e inteligente, existem os gerenciadores de estado.

Se você não conhece o termo estado, podemos fazer uma analogia simples:

Imagine: é sexta-feira e você está deitado(a) no sofá, quase dormindo. Nesse momento, seu estado é sonolento. Então, uma amiga - super empolgada - liga e anima você a sair de casa - então, seu estado mudou de sonolento(a) para animado(a).
No contexto de uma aplicação Flutter, o estado está relacionado aos diferentes valores que uma variável pode assumir. Lembra quando falamos que um app muda o tempo todo? Pois é: o app vai passando por diferentes estados.

No caso do nosso contador de produtos, ele pode ter vários estados:

Zero produtos;
1 produto;
2 produtos;
etc.
O nosso carrinho, também, pode ter vários estados:

1 pizza e 1 chicken salad selecionados;
2 pizzas selecionadas.
Como você pode ver, são muitos estados possíveis para cada um dos produtos - chicken salad, pizza etc. Para gerenciar de forma organizada tantos dados (que mudam constantemente) é que utilizamos, justamente, os gerenciadores de estado. Além disso, esses eles têm outras vantagens:

Mais controle e poder de codar: eles ajudam pessoas desenvolvedoras a ter um melhor controle de variáveis/objetos. Por exemplo: os gerenciadores nos dão a habilidade de fazer o Flutter saber quando ocorreram mudanças e se essas mudanças devem ser refletidas na tela para a pessoa usuária. Se a pessoa adicionou dois produtos no carrinho, é interessante que o “valor total” do carrinho seja atualizado com o novo valor (estado);
Mais performance: o gerenciador de estado permite atualizar trechos específicos do widget, em vez do widget inteiro - o que aumenta a performance do código;
Mais facilidade e flexibilidade para a pessoa dev: lembrando das nossas limitações com o setState, elas não são necessariamente limitações do que o Flutter consegue fazer, mas impõe uma camada de dificuldade desnecessária quando vamos codar uma aplicação. Em resumo: tudo o que gerenciadores de estado fazem, no fundo, são funcionalidades padrão do Flutter, mas organizadas de uma maneira que facilita o nosso processo de desenvolvimento.
Nesse curso, você aprenderá a lidar com o MobX - um famoso gerenciador de estados.

Independente do gerenciador de estado que nós vamos utilizar, é importante separar as responsabilidades em arquivos diferentes. É o que veremos na próxima aula!
Bons estudos!

@@07
O que aprendemos?

Nessa aula, você aprendeu como:
Baixar e entender o código e organização do projeto Panucci Delivery;
Compreender as limitações do Stateful widget e do setState() quando precisamos alterar e exibir variáveis em aplicativos mobile;
Entender o que são gerenciadores de estado e para que servem.
Concluímos nossa primeira aula! Vejo você a seguir.

Bons estudos!