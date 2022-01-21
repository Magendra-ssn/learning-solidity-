// SPDX-Liscense-Identifier: MIT

pragma solidity ^0.6.0;
import "./simplestorage.sol";

contract storagefactory is simplestorage
{
    simplestorage[] public arr;

    function createsf()
    public
    {
        simplestorage stor = new simplestorage();
        arr.push(stor);
    }

    function sfstore(uint256 ind, uint256 val)
    public
    {
        //to interact with contract we need address and ABI
        simplestorage stor1 = simplestorage(address(arr[ind]));
        stor1.store(val);
    }

    function sfget(uint256 x)
    public view returns(uint256)
    {
        simplestorage stor2 = simplestorage(address(arr[x]));
        return stor2.print();
    }
    

}
