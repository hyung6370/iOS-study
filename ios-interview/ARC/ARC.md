# ARC

### Q) ARC란 무엇인지 설명하시오.
A) Auto Reference Count의 약어로 참조 카운트가 0이 아닐 때는 메모리를 할당하고 0일 때는 메모리를 해제하는 메모리 관리 방식을 뜻한다.

### Q) Retain Count 방식에 대해 설명하시오.
- 객체의 레퍼런스 카운트를 감소한다. 
- 컴파일 타임에 자동으로 retain, release 메서드를 적절한 위치에 넣어서 작동시킨다.
= retain count가 0이 되면, 객체가 메모리에서 해제된다.

### Q) Strong과 Weak 참조 방식에 대해 설명하시오.
- strong : Reference Count를 증가시켜 ARC로 인한 메모리 해제를 피하고, 객체를 안전하게 사용하고자 할 때 사용한다.
- weak : 순환 참조에 의해 메모리 누수를 막기 위해 사용한다.
- unowned : 객체의 life cycle이 명확하고 개발자에 의해 제어 기능이 명확한 경우, weak Optional 타입을 대신하여 사용한다.

### Q) 순환 참조에 대하여 설명하시오.
A) 순환 참조란 두 가지 이상의 객체가 서로에 대한 Strong Reference(강한 참조) 상태를 가지고 있을 때 발생하며, 순환 참조가 발생하게 되면 서로에 대한 참조가 해제되지 않기 때문에 메모리에서 유지되며 이로 인해 메모리 누수가 발생하게 된다.

### Q) 강한 순환 참조(Strong Reference Cycle)는 어떤 경우에 발생하는지 설명하시오.
A) 두 인스턴스가 서로가 서로를 참조하고 있는 상황에서 발생한다. 따라서 하나의 인스턴스를 참조하는 변수가 nil이 되어서 메모리가 해제 되어야 하는 시점에서도 인스턴스를 참조하고 있는 인스턴스가 있어서 reference count는 여전히 1이기 때문에 메모리 해제가 되지 않아 메모리 누수가 발생한다.