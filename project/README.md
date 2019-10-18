# Generating Vampire Numbers
	
## Project compiled by
	Akash Jajoo
	Niraj Chowdhary


## Vampire number
In mathematics , a **vampire number** (or **true vampire number**) is a composite natural number with an even number of digits, that can be factored into two natural numbers each with half as many digits as the original number and not both with trailing zeroes, where the two factors contain precisely all the digits of the original number, in any order, counting multiplicity. The first vampire number is 1260 = 21 × 60. Here 21 and 60 are called the fangs of 1260. Some numbers have multiple fangs. Example- 125460 has 4 fangs i.e. 615 × 204 and 510 × 246.

## Description
Devised an algorithm using elixir programming language to 
generate vampire numbers between the given range. The purpose of this project was to get hands on experience in 	the **concurrency** and **fault tolerance** aspects of the distributed system. We achieved concurrency by using an Actor model (GenServers) and fault tolerance by using the Supervisor model. Eight actors are used to perform the computation.

## Steps to execute
* Download the vampire file to your local machine.
* On command line shell go to the project directory inside the vampire folder.
* Run the command **mix run proj1.exs arg1 arg2**.
	* arg1: lower even digit integer number
	* arg2: higher even digit integer number
	* Example: mix run proj1.exs 1000 2000


## Screenshots of outputs

Vampire between 1000 to 2000
[ ![1000-2000.png](https://i.postimg.cc/63MF08Sx/1000-2000.png)](https://postimg.cc/Kkg9c8x0)


Vampire between 100000 200000[
![10000-20000.png](https://i.postimg.cc/Ls6cZkC3/10000-20000.png)](https://postimg.cc/LJwCcPMJ)

[![10000-20000-1.png](https://i.postimg.cc/Kz53s2r2/10000-20000-1.png)](https://postimg.cc/ftJbJ1r2)

## Results
CPU time- 5.852s   
User time- 5.717s   
Sys time- 0.135s  
Real time- 2.853s  