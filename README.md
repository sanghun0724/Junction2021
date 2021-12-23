# Junction2021
<img src="https://user-images.githubusercontent.com/66512239/147200861-fd12d83e-b504-461d-9195-fa4d5092ea6d.PNG"  width="370" height="700"><img src="https://user-images.githubusercontent.com/66512239/147200818-f0fd35f7-9fd1-44c0-bb5a-9e36e43def10.PNG"  width="370" height="700"><img src="https://user-images.githubusercontent.com/66512239/147200840-2f171eca-0bb4-4e7c-8f8b-5ffc124bbaa1.PNG"  width="370" height="700"><img src="https://user-images.githubusercontent.com/66512239/147200850-a0bb056f-4806-4a97-b2db-3a7a6095ee10.PNG"  width="370" height="700"><img src="https://user-images.githubusercontent.com/66512239/147200853-ea6d35e7-6aa4-4f6a-983d-a0abb3b86986.PNG"  width="370" height="700"><img src="https://user-images.githubusercontent.com/66512239/147200832-c8acb44d-e521-4e70-b291-59823f698e3b.PNG"  width="370" height="700">


junction이라는 국제 해커톤 에서 iOS 2명, 백엔드 2명 , 디자이너 2명 해서 만든 프로젝트 (2박3일 온라인)

## 컨셉 

코로나 시대의 원격근무상황에 생산성을 늘릴수 있는 서비스 어플리케이션을 미션주제가 주어져 만든 프로젝트

기본적인 채팅기능을 바탕으로 채팅 텍스트에 각 분야의 전문적인 용어가 나오면  해당 용어는 하이라이트 표시가 되고 클릭을 하게 되면 해당 내용의 단어 뜻을 바로바로 볼수있고 관리할수 있게 해주어 서로 다른 분야의 사람들이 채팅을 할때 커뮤니케이션을 돕는 어플이다.

## 사용기술들 

채팅 소켓을 구현하게 위해 socketIO 라이브러리를 쓰고 

해당 텍스트를 하이라이트 하는데에는 프리스타일러라는 스트링하이라이팅해주는 라이브러리를 사용하였다.  

## 기술들을 선택한이유 

 1.먼저 채팅 소켓을 한번도 구현해본적이 없었기에 혹시라도 모를 실수에 대비하여 가장 자료가 많은 흔한 라이브러리를 선택해야 했다. 해당 깃 리드미 또한 잘 정리되어 있었다. 

1. 스트링 관련해서는 라이브러리를 찾기전에 먼저 attributeString 으로 해결해보려 했으나 테이블뷰가 업데이트 되고 attributeString으로 해당 용어를 찾고 적용하기에는 딜레이가 너무컸다. 딜레이 줄이는데는 많은시간이 필요할것으로 판단하여 제한시간내에 프로젝트를 완성시키기 위해 라이브러리를 찾아 썻다.

## 어려웠던 점 
 기본적인 delegate패턴에서 위임자를 지정해주는 코드를 까먹어 용어에 대한 설명을 chatView에서 PopUPview로 전달하는데 애를 먹고 있었고 마감시간은 거의 다와가는 상황이였다. 제출은 해야 하는 상황이니 일단 임기응변으로 데이터전달을 userdefault를 사용하여 chatview에 데이터를 저장하고 popupView에서 꺼내쓰는 형식으로 만들었었다. (비효율적인 방법인건 알지만 상황에 맞추는 유연성은 필요하다고 생각했다)

 
## 내 역할
전체 프론트단은 다만들었다. 한분 iOS 분이 더 계셨지만 아직 경험이 많이 없으셨어서 메인은 제가 다맡고 그분한테는 감당가능할만한 조그마한  부가적인 기능을 맡기고 제가 봐주는 식으로 진행했었다. (용어에 대한 검색,정렬하는 TableView정도)
