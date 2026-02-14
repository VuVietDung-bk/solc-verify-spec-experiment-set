/*
 * @source: etherscan.io 
 * @author: -
 * @vulnerable_at_lines: 17
 */

pragma solidity >=0.7.0;
 
contract airDrop{
    
    function transfer(address from,address caddress,address[] memory _tos,uint v, uint _decimals)public returns (bool){
        require(_tos.length > 0);
        bytes4 id=bytes4(keccak256(abi.encodePacked("transferFrom(address,address,uint256))")));
        uint _value = v * 10 ** _decimals;
        for(uint i=0;i<_tos.length;i++){
            // <yes> <report> UNCHECKED_LL_CALLS
            caddress.call(abi.encodeWithSelector(id,from,_tos[i],_value));
        }
        return true;
    }
}