### Tarefa 02

Bruno Freire e Vinicius Teixeira

# Go Language

### Origens

A linguagem Go nasceu nos escritórios do Google, em 2007, como um projeto interno em resposta a alguns problemas de infraestrutura enfrentados pela empresa na hora de desenvolver sistemas mais complexos. Rob Pike, Ken Thompson e Robert Griessemer foram os responsáveis pela criação da linguagem e iniciaram o desenvolvimento de tempo parcial. Houveram tentativas frustradas de resolver esses problemas com linguagens já existentes (Java, C++, Python), mas apesar de cada uma dessas linguagens possuírem características desejáveis, o principal era ter todas essas características em apenas uma linguagem.

Em 2008, Go passou de um projeto de tempo parcial para um projeto de tempo integral no Google, e com isso, muitos outros engenheiros participaram, além dos fundadores. Em 2009, Go se tornou Open Source e em 2010, começou a ser adotada por desenvolvedores de fora do Google.

Poucos dias após o lançamento da linguagem, Fancis McCabe, desenvolvedor da linguagem chamada Go!, solicitou uma mudança de nome da linguagem do Google, para evitar confusões. McCabe criou Go! em 2003, mas não registrou o nome. O tópico de problema aberto sobre o assunto foi fechado por um desenvolvedor do Google em 12 de outubro de 2010 com o status personalizado "Unfortunate" e com o seguinte comentário: "há muitos produtos e serviços de computação chamados Go.

Atualmente está na versão Go 1.11 (August 2018) e diversas empresas, como Amazon, YouTube, Docker, utilizam essa linguagem.

### Influencias

Algumas linguagens serviram de influência para a Go Lang como: C++, Python, Java e diversas outras linguagens.  O objetivo de se espelhar nessas linguagens era trazer características importantes para trabalhar com a infraestrutura Google, como: linguagem compilada, garbage-collector, estaticamente tipada, lidar com concorrência, síntaxe simples, dentre outras que foram reunidas nesta nova linguagem denominada Go!

Embora GoLang tenha se espelhado em diversas linguagens para absorver suas características, muitas funcionalidades vistas nessas linguagens ficaram de fora. São elas: tratamento de erro, herança, generics, assertions, sobrecarga de métodos.

### Classificação e Tipagem

Go é uma linguagem compilada como JAVA e C#, mas possui uma compilação bem rápida que superará as linguagens que são interpretadas ou rodam em máquinas virtuais. Forte e estaticamente tipada (a amarração das variáveis não pode ser alterada durante a execução). Possui orientação a objetos: o Go não possui classes como JAVA, mas possui tipos. A linguagem utiliza estruturas e métodos que funcionam de forma bem parecida com as classes de outras linguagens, além do uso de Interfaces (uma característica da Orientação a Objetos de Go).

Se fossemos resumir Go em duas palavras seriam: simplicidade e performance. A razão desta linguagem ser criada é que os autores queriam uma linguagem que fosse fácil de programar e com alta capacidade de performance. Diferente de C e C++ que possuem performance, porém complexidade de desenvolvimento.

O Go tenta combinar a facilidade de uma linguagem de programação interpretada e dinamicamente tipada (Javascript e Python), com a eficiência e segurança de uma linguagem de programação estaticamente tipada (C e C++). É possível observar isso em alguns aspectos, como por exemplo a inferência de tipos.

<pre><code>var(
	name string
	age int
	location string
)

Sem Inferência</code></pre>

<pre><code>var(
	name = "T'Chala"
	age = 33
	location = "Wakanda"
)

Com Inferência</code></pre>

Neste exemplo, ambos formatos de declaração de variáveis resultarão nos mesmos tipos. Observando a imagem é possível notar que no primeiro formato os tipos estão sendo definidos explicitamente. Já no segundo formato, o valor é atribuído diretamente, sem a necessidade da especificação do tipo (muito semelhante às linguagens dinamicamente tipadas).


### Características

 - Compilada (Goroutines)
 - Garbage-Collected
 - Tem seu próprio Go Runtime
 - Sintaxe Simples
 - Excelente pacote padrão
 - Multiplataforma
 - Orientada a Objetos (sem herança)
 - Estaticamente e fortemente tipada
 - Concorrente
 - Suporte a closures
 - Dependencias explicitas
 - Funções com multiplos retornos
 - Ponteiros

### Uso

Uma linguagem focada em concorrencia. Se fossemos resumir Go em duas palavras seriam: simplicidade e performance. A razão desta linguagem ser criada é que os autores queriam uma linguagem que fosse fácil de programar e com alta capacidade de performance.
O Go tenta combinar a facilidade de uma linguagem de programação interpretada e dinamicamente tipada com a eficiência e segurança de uma linguagem de programação estaticamente tipada.


### Expressividade

#### i. Concorrência

Go traz uma maior simplicidade na implementação, economia de memória (com o uso de Goroutines) e compartilhamento de dados, com segurança, entre Goroutines, durante a execução.

<pre><code>package main
import "fmt"
func main() {
	go f()
	go g()
}

Concorrência GoLang</pre></code>

<pre><code>
using System;
using System.Linq;
using System.Threading;

namespace ConsoleApllication
{
	class Program
	{
		static void Main(string[] args)
		{
			Thread t1 = new Thread(contThread1);
			Thread t2 = new Thread(contThread2);
			
			t1.Start();
			t2.Start();
		}
	}

}

Concorrência C#</code></pre>

Go traz uma maior simplicidade na implementação, na economia de memória (com o uso de Goroutines) e no compartilhamento de dados entre Goroutines durante a execução, de forma prática e segura.

#### ii. Garbage-Collector

Diferente de C, Go não necessita que o programador libere a memória. Go tem um eficiente e performático garbage collector, fazendo com que o programador não precise se preocupar com o gerenciamento de memória como no código C abaixo.

<pre><code>
#include<stdio.h>
#include<stdlib.h>

void aloca()
{

int *ptr;
ptr = (int *) malloc(100);

free(ptr);

}
</code></pre>
