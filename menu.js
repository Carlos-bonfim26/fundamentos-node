//instalado a biblio que permite entrada de dados
import PromptSync from "prompt-sync";
//aciona a função da biblio
let prompt = PromptSync();
//class é um modelo de algo(objeto)
class Pessoa {
  //atributo privado
  #senha;
  #palavraChave;
  //construtor constroi mais de um objeto
  //para por os valores de cada obj, colocamos via parametro
  constructor(nome, dataNasc, senha, palavraChave) {
    this.nome = nome;
    this.dataNasc = new Date(dataNasc).toLocaleString("pt-BR");
    this.#senha = senha;
    this.#palavraChave = palavraChave;
  }
  apresentar() {
    console.log(`Olá me chamo ${this.nome}, tenho ${this.idade} anos`);
  }
  //metodo especial que permite eu gerenciar a visualizacao da senha
  get senha() {
    const palavraChave = prompt(
      "Para ve a sua senha, você precisa digitar a palavra chave: "
    );
    //condicional simples
    if (this.#palavraChave === palavraChave) {
      return this.#senha;
    } else {
      return "Foi mal, tente novamente!";
    }
  }
}
class Aluno extends Pessoa {
  constructor(nome, dataNasc, senha, curso, matricula) {
    super(nome, dataNasc, senha);
    this.curso = curso;
    this.matricula = matricula;
  }
  apresentar() {
    console.log(`Olá me chamo ${this.nome}, e estou cursando ${this.curso}`);
  }
}
class Professor extends Pessoa {
  constructor(
    nome,
    dataNasc,
    senha,
    salario,
    especialidade,
    registroFuncionario
  ) {
    super(nome, dataNasc, senha),
      (this.salario = salario),
      (this.especialidade = especialidade),
      (this.registroFuncionario = registroFuncionario);
  }
  apresentar() {
    console.log(
      `Olá, sou o docente ${this.nome}, e sou especialista em ${this.especialidade}`
    );
  }
}
function cadastro() {
  let nomePessoa = prompt("Digite o seu nome: ");
  let dataNascPessoa = prompt(
    "Digite sua data de nascimento no formato AAAA/MM/DD: "
  );
  let senhaPessoa = prompt("Digite sua senha: ");
  let isProfessor = parseInt(
    prompt(
      "Você é professor ou aluno, se for professor digite 1, se for aluno digite 2: "
    )
  );
  if (isProfessor === 1) {
    let salario = parseFloat(prompt("digite o seu sálario: "));
    let especialidade = prompt("Digite o sua especialidade: ");
    let registro = prompt("digite o seu registro: ");
    return new Professor(
      nomePessoa,
      dataNascPessoa,
      senhaPessoa,
      salario,
      especialidade,
      registro
    );
  } else if (isProfessor === 2) {
    let curso = prompt("Digite o seu curso: ");
    let matricula = prompt("digite o sua matricula: ");

    return new Aluno(nomePessoa, dataNascPessoa, senhaPessoa, curso, matricula);
  } else {
    console.log("número inválido");
  }
}
const usuario = cadastro();

usuario.apresentar();
