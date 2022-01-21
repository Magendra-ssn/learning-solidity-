// SPDX-Liscense-Identifier: MIT

pragma solidity ^0.6.0;

contract storage1
{
    uint public m;
    
    struct people
    {
        uint256 mag;
        string name;
    }

    people[] public arr;  //dynamic array
    mapping(string => uint256) public nametomag;
    

    function store(uint x)
    public 
    {
        m=x;
    }

    function print()
    public view returns(uint256)
    {
        return m;
    }

    function addperson ( string memory name1, uint256 mag1)
    public
    {
        arr.push(people({mag: mag1, name: name1}));
        nametomag[name1] = mag1;
    }
    
}
