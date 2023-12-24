//SPDX-License-Identifier: MIT
pragma solidity ^0.8.23 ;
pragma abicoder v2;


import "@openzeppelin/contracts/utils/Address.sol" ;
import { FeeManagerComponentValue } from "./components/FeeManagerComponentValue.sol" ;
import { FeeManagerComponentValueAmountStatic } from "./components/FeeManagerComponentValueAmountStatic.sol" ;


contract FeeManagerValue is FeeManagerComponentValue, FeeManagerComponentValueAmountStatic {

    using Address for address payable ;

    /// @dev Non `reentrancy-safe` and non `address(0)-destination-safe`
    function _chargeFees(address feeCollector, address feePayer, address feeReceiver) internal virtual {
        uint256 fee = feeAmount(feeCollector) ;
        if ( msg.value < fee ) revert InsufficientValue() ;

        payable(feePayer).sendValue(feeReceiver, fee) ;
        emit FeeCharged(feeCollector, feePayer, fee) ;
    }

}
