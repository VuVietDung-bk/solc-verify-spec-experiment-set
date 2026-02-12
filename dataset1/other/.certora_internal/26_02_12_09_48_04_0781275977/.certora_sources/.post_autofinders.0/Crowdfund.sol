// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0;

/**
 * @title Crowdfund
 * @dev Crea un Crowdfund público
 * @notice El inversor mayoritario se llevará el 10% de la inversión total
 */
contract Crowdfund {

    uint public constant STAKE_TARGET = 1000;                     // Target de inversión en Finney (1 ether = 1000 finney)
    uint8 public constant MAX_ADMISSIBLE_STAKE_INCREASE = 100;    // Máximo incremento de inversión permitido en finney
    uint8 public constant MIN_ADMISSIBLE_STAKE_INCREASE = 2;      // Mínimo incremento de inversión permitido en finney

    mapping (address => uint8) public stakes;                     // Mapeo de las inversiones de cada inversor
    uint8 public maxStake;                                        // Máxima inversión actual en finney, Si es 0 el crowdfunding está cerrado
    address public leadInvestor;                                  // Dirección del inversor mayoritario

    constructor() {
        stakes[msg.sender]=1; // Las inversiones deben de ser mayores que 2 finney, de forma que sólo el owner cumplirá 'stakes[msg.sender] == 1'
        maxStake = 1;         // Abrimos el crowdfunding
        leadInvestor = msg.sender;
    }

    

    /**
     * @dev Permite a un usuario invertir 
     * @notice El crowdfunding debe de estar abierto
     * @notice El incremento de la inversión debe de ser mayor que el mínimo, menor que el máximo y múltiplo de 1 finney
     */
    function stake() public payable {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000000, 1037618708480) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000004, 0) }
        require(stakes[msg.sender] != 1, unicode"El dueño no puede invertir");
        require(maxStake > 0, unicode"La inversión está cerrada");
        require(checkIntegerFinney(msg.value), unicode"Solo se aceptan incrementos múltiplos de 1 finney");
        uint8 increasingStake = uint8(msg.value/10**15);assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000001,increasingStake)} // msg.value is in wei. 1 finney == 10**-3 ether == 10**15 wei
        require(
            increasingStake <= MAX_ADMISSIBLE_STAKE_INCREASE 
            && increasingStake > MIN_ADMISSIBLE_STAKE_INCREASE,
            unicode"Tu incremento de inversión no está en el rango"
        );

        uint8 prevStake = stakes[msg.sender];assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000002,prevStake)}
        uint8 minMajorIncStake = (maxStake - prevStake);assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000003,minMajorIncStake)}      // Mínimo incremento de inversión para ser el inversor mayoritario
        uint8 newStake = prevStake + increasingStake;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000004,newStake)}
        stakes[msg.sender] = newStake;
        if (increasingStake > minMajorIncStake) {
            maxStake=newStake;
            leadInvestor = msg.sender;
        }
    }

    /**
     * @dev Permite al owner del crowdfunding recoger el fondo de inversión y cerrar el crowdfunding
     * @notice Solo el owner puede recoger el dinero
     * @notice El crowdfunding debe de estar abierto y haber superado el target de inversión
     * @notice Dejará el 10% del fondo para el inversor mayoritario
     */
    function closeFund() public {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00040000, 1037618708484) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00040001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00040004, 0) }
        require(stakes[msg.sender] == 1, unicode"Tú no eres el owner");
        require(maxStake > 0,unicode"El crowdfunding no está abierto");
        require((address(this).balance/10**15) >= STAKE_TARGET, unicode"No se ha superado el target de inversión");
        maxStake = 0; // Cerrar el crowdfunding
        payable(msg.sender).transfer((address(this).balance * (90 * 10**18)) / 10**20); // Recoger el 90% de la inversión        
    }

    /**
     * @dev Permite al inversor mayoritario retirar su parte de los fondos
     * @notice El inversor mayoritario se llevará el 10% de la inversión total
     * @notice El crowdfunding debe de estar cerrado, lo que implica que el owner ha recogido el 90% de la inversión
     */
    function withdraw() public {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00030000, 1037618708483) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00030001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00030004, 0) }
        require(maxStake == 0,unicode"El crowdfunding no está cerrado");
        require(msg.sender == leadInvestor, unicode"Tú no eres el inversor mayoritario");
        payable(msg.sender).transfer(address(this).balance);       
    }    

    /**
     * @dev Devuelve el balance del crowdfounding, es decir, el total de las inversiones
     */
    function getTotalStake() public view returns (uint256) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00010000, 1037618708481) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00010001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00010004, 0) }
        return address(this).balance;
    }

    /**
     * @dev Comprueba si un número es múltiplo de 1 finney
     * @param amount Número a comprobar
     */
    function checkIntegerFinney(uint amount) public pure returns (bool) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00020000, 1037618708482) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00020001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00020005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00026000, amount) }
        return (amount % 10**15 == 0);
    }

}