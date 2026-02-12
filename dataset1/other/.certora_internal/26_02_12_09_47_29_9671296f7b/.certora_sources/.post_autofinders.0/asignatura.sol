pragma solidity >=0.7.0;

contract Asignatura {

	address public profesor; //Usuario que despliega el contrato
	string public nombre;
	string public curso;
	Evaluacion[] public evaluaciones; //Array de evaluaciones
	address[] public matriculas; //Direccion de los alumnos matriculados

	struct Evaluacion {
		string nombre;
		uint fecha;
		uint puntos;
	}

	struct Alumno {
		string nombre;
		string email;
	}

	enum TipoNota {NP, NORMAL, MH}

	struct Nota {
		TipoNota tipo;
		uint calificacion;
	}

	constructor(string memory _nombre, string memory _curso) public {
		profesor = msg.sender; //el profesor despliega el contrato
		nombre = _nombre;
		curso = _curso;
	}

	/*-----------------------------GETTERS------------------------------*/

	function getNombre() public view returns(string memory) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00070000, 1037618708487) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00070001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00070004, 0) }
		return nombre;
	}

	function getCurso() public view returns(string memory) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00010000, 1037618708481) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00010001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00010004, 0) }
		return curso;
	}

	function getDireccionProfesor() public view returns(address) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00020000, 1037618708482) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00020001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00020004, 0) }
		return profesor;
	}

	function evaluacionesLength() public view returns (uint) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00060000, 1037618708486) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00060001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00060004, 0) }
		return evaluaciones.length;
	}
	
	function matriculasLength() public view returns(uint) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00030000, 1037618708483) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00030001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00030004, 0) }
		return matriculas.length;
	}

	/*-----------------------------MÉTODOS------------------------------*/

	function creaEvaluacion(string memory _nombre, uint _fecha, uint _puntos) logInternal9(_puntos)soloProfesor public payable returns (uint) {
		evaluaciones.push(Evaluacion(_nombre, _fecha, _puntos));
		return evaluaciones.length-1;
	}modifier logInternal9(uint256 _puntos) { assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00090000, 1037618708489) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00090001, 3) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00090005, 73) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00096002, _puntos) } _; }

	function automatricula(string memory _nombre, string memory _email) logInternal5(_email)noMatriculados noVacio public {
		Alumno memory alumno = Alumno(_nombre, _email);assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00010001,0)}
		datosAlumno[msg.sender] = alumno;
		matriculas.push(msg.sender);
	}modifier logInternal5(string memory _email) { assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00050000, 1037618708485) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00050001, 2) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00050005, 9) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00056001, _email) } _; }

	function quienSoy() logInternal0()soloMatriculados public view returns (string memory _nombre, string memory _email) {
		Alumno memory alumno = datosAlumno[msg.sender];assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00010002,0)}
		_nombre = alumno.nombre;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0002000b,0)}
		_email = alumno.email;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0002000c,0)}
	}modifier logInternal0() { assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000000, 1037618708480) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000004, 0) } _; }

	mapping (address => Alumno) public datosAlumno;

	mapping (address => mapping (uint => Nota)) public calificaciones;

	function califica(address alumno, uint evaluacion, TipoNota tipo, uint calificacion) logInternal4(calificacion)soloProfesor public {
		Nota memory nota = Nota(tipo, calificacion);assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00010003,0)}
		calificaciones[alumno][evaluacion] = nota;
	}modifier logInternal4(uint256 calificacion) { assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00040000, 1037618708484) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00040001, 4) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00040005, 585) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00046003, calificacion) } _; }

	function miNota(uint evaluacion) logInternal8(evaluacion)soloMatriculados public view returns (TipoNota _tipo, uint _calificacion) {
		Nota memory nota = calificaciones[msg.sender][evaluacion];assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00010004,0)}
		_tipo = nota.tipo;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0002000d,0)}
		_calificacion = nota.calificacion;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000000e,_calificacion)}
	}modifier logInternal8(uint256 evaluacion) { assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00080000, 1037618708488) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00080001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00080005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00086000, evaluacion) } _; }

	/*-----------------------------MODIFIERS------------------------------*/
	
	modifier soloProfesor() {
        require(msg.sender == profesor, "Solo permitido al profesor");
        _;
    }
    
    modifier soloMatriculados() {   
        string memory _nombre = datosAlumno[msg.sender].nombre;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00010005,0)}
        bytes memory b = bytes(_nombre);assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00010006,0)}
        require(b.length != 0, "Solo permitido a alumnos matriculados");
        _;
    }
    
    modifier noMatriculados() {    
        string memory _nombre = datosAlumno[msg.sender].nombre;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00010007,0)}
        bytes memory b = bytes(_nombre);assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00010008,0)}
        require(b.length == 0, "Solo permitido a alumnos no matriculados");
        _;
    }

    modifier noVacio() {
		string memory _nombre = datosAlumno[msg.sender].nombre;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00010009,0)}
    	bytes memory b = bytes(_nombre);assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0001000a,0)}
        require(b.length != 0, "El nombre no puede ser vacio");
        _;
    }

}