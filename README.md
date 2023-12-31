# README


A solidity library for fee management. That is, every dApp usually charge a fee for
his services, these library will help you with that.


# Architecture


Broadly speaking contracts in these repo can be divided in `presets`, `contracts` and `components`.

* Components are minimal building blocks used by contracts.
* Contracts has more complete features for certain use cases but without assuming any security or regulatory mechanism.
* Presets are ready to use contracts which use a predefined and popular security/access mechanism.


# Contracts


Contracts are divided in those designed so they can manage fees for a single contrat
and the fee charging functionality is part of the inheritor contract(`FeeCharger*`)
and those that manage fees for a set of contract or for a complete smart contract system
and that functionality wants to be kept external(`FeeManager*`). In the case of `FeeManager*`
family of contracts they usually enforce and manage separately a default fee.

Additionally, these contracts are divided in those who charge fees using native cryptocurrency
which have `Value` in their name or those how use ERC20 tokens which have `ERC20` in their name.

Lastly is how the amount to charge is managed. The amount could be `static`, `operations` or `dynamic`.
The `static` case is where the fee amount to charge is predefined. 
The `operations` case allow to set a fee per function.
The `dynamic` case is where the fee must be calculated in execution time according to certain parameters.

Contracts `FeeChargerValue` and `FeeChargerERC20` obtain the fee amount to charge by reading a predefined state variable(statically).
Contracts `FeeChargerValueDynamic` and `FeeChargerERC20Dynamic` calculate the current fee acording to arbitrary parameters(dynamically).
Contracts `FeeChargerValueOperations` and `FeeChargerERC20Operations` allow to define a fee amount for every function and charge accordingly to current function being called, aditionally allow to define a default fee.

