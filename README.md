# CoreAnimation

`CoreAnimation`이란, iOS 그리고 OSX에서 사용가능한 그래픽 랜더링이자 애니메이션 인프라이고, 뷰나, 시각적요소를 애니메이션화 하는데 사용할 수 있다. CoreAnimation Framework에는 애니메이션을 위한요소들이 준비되어있으며, 그것을 사용하기 위해서는 단지, 파라미터를 구성해주기만 하면 된다.(예: startPoint, endPoint). 이떄 대부분의 그리기 작업은 GPU가 수행하게되고 나머지 부분을 CoreAnimation이 수행하게된다. 자동 그래픽 가속의 결과로, 앱 속도를 저하, CPU부하 없이 높은 프레임과, 부드러운 애니메이션을 얻게된다.

<img width="272" alt="Screen Shot 2022-03-19 at 2 13 52 AM" src="https://user-images.githubusercontent.com/79059747/159051076-5ecd5a51-eeae-4e5e-9cfa-eae4ae2f7dec.png">

## Core Animation Manages Your App's Content
CoreAnimationdms 드로잉 시스템 자체가 아니다. 그것은 하드웨어에서 앱의 콘텐츠를 조립하고, 조작하기위한 인프라이다. 인프라의 중심에는 layer객체가 있는데, layer는 콘텐츠를 관리하고 조작하는데 사용된다.
layer는 GPU로 부터 쉽게 조작되는 `bitmap`으로 컨텐츠를 캡쳐한다. 대부분의 앱에서, layer는 View의 컨텐츠를 관리하는 방법으로 이용된다. 또한, 필요에따라 독립적인 layer를 만들 수도 있다.
## Layer Modifications Trigger Animations
CoreAnimation으로 만든 대부분의 애니메이션은 layer의 프로퍼티의 수정을 포함하고 있다. 뷰와 같이, layer 객체들은  bounds rectangle, a position onscreen, an opacity, a transform, and many other visually-oriented properties를 가지고있다.(이들 프로퍼티는 수정가능하다.)이들프로퍼티의 대부분은, 프로퍼티의 값이 변하면 암시적인 애니메이션을 만들게 된다. 
결과애니메이션 동작을 더잘 제어하기위해 명시적으로 애니메이션을 만드는것도 가능하다.
## Layers can be organized into hierarchies
Layer는 부모-자식관계를 만드는 것으로 계층적으로 배열될 수 있다. layer의 배열은 뷰와 비슷한방식으로 layer가 관리하는 컨텐츠에 영향을 끼친다. 뷰에 연결된 layer 세트의 계층은 해당 뷰 계층 구조를 반영합니다. 또한 앱의 시각적인 컨텐츠를 확장하기 위해 layer 계층에 독립적인 layer를 추가할 수도있다.
## Actions Let You Change a Layer's Default Behavior
Implicit layer animation은 미리 정의된 인터페이스를 구현하는 일반 객체인 액션 객체를 사용하여 달성됩니다. CoreAnimation은 일반적으로 관련된 레이어들과 함께 애니메이션의 default set을 수행하기위해 action object를 사용합니다. 커스텀 애니메이션을 수행하기위해 고유한 action object를 만들 수있으며, 다른 타입의 동작을 수행하기위해 그 객체들을 사용할 수도 있습니다. 그런 다음 작업 객체를 레이어의 속성 중 하나에 할당합니다. 그 속성이 변경되면, 코어 애니메이션은 액션 객체를 검색하고 작업을 수행하도록 지시합니다. 
