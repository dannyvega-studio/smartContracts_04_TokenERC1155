pragma solidity ^0.6.0;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";

//Usamos la declaracion is ERC1155 para poder usar todas las funciones con las que cuenta el estandar
//Principalmente la funcion _mint que es la que se encargara de la creacion de los tokens.
contract nikeCollections  is ERC1155 { 

    //declaramos los identificadores del distinto calzado de Nike
    uint256 private constant LEVRONJAMES = 0;
    uint256 private constant MICHAELJORDAN = 1;
    uint256 private constant KOBEBRYANT = 2;

    //para facilitar la administracion los colocamos en una matriz
    uint256[] listIds = [LEVRONJAMES,MICHAELJORDAN,KOBEBRYANT];

    //ahora declaramos el constructor que sera el mismo que ERC1155.sol
    constructor() public ERC1155 ('https://mockapi.io/tokens/{id}'){
        
    }

    //En esta funcion se crearan los tokens
    //La declaracion _minBatch se ocupa de la creacion de multiples tokens marcados por diferentes identificadores
    function createToken (
        address account,
        uint256[] memory ids,
        uint256[] memory amounts,
        bytes memory data) public {
            ids = listIds;
            _mintBatch(account, ids, amounts, data);    
        }

    //Y por ultimo una sencilla funcion que nos regresa la lista de identificadores
    function getIds() public view returns(uint256[] memory){
        return listIds;
    }

}