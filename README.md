# MC3 SounDrill

![SounDrill2](https://github.com/DeveloperAcademy-POSTECH/MC3_Team18_Ewook-IDLE/assets/108044639/3381a654-6a86-4904-a2e6-844d45e680bd)


<h1 align="middle">😴SounDrill😴</h1>
<p align="middle">발성 및 노래실력 향상을 위해 누구나 쉽고 재미있게 참여할 수 있는 iOS 게임 어플리케이션 </p>

<br><br>
# 서비스 소개
<p align="left">
<h2> SounDrill: 음성과 발성 향상을 위한 어플리케이션 </h2>

음성과 얼굴 추적 기술을 활용한 혁신적인 발성 및 노래실력 향상 경험을 즐겨보세요! SounDrill은 뛰어난 iOS 게임 애플리케이션으로, 발음과 노래실력을 즐겁게 향상시킬 수 있는 기회를 제공합니다. 모두가 손쉽게 참여하여 멋진 발성과 노래실력을 개선해보세요.</p>

<br><br>
# 프로젝트 기술 스택

### 공통

<img src="https://shields.io/badge/GitHub-181717?logo=GitHub&logoColor=FFF&style=flat-square"/> <img src="https://shields.io/badge/Sketch-F7B500?logo=Sketch&logoColor=FFF&style=flat-square"/> <img src="https://shields.io/badge/Miro-050038?logo=Miro&logoColor=FFF&style=flat-square"/> <img src="https://shields.io/badge/microsoftteams-6264A7?logo=microsoftteams&logoColor=FFF&style=flat-square"/> <img src="https://shields.io/badge/Notion-000000?logo=Notion&logoColor=FFF&style=flat-square"/> <img src="https://img.shields.io/badge/Figma-F24E1E?logo=Figma&logoColor=white&style=flat-square"/>


#F24E1E

### 개발스택 (Development Stack)
<img src="https://shields.io/badge/iOS-000000?logo=iOS&logoColor=FFF&style=flat-square"/> <img src="https://shields.io/badge/Xcode-147EFB?logo=Xcode&logoColor=FFF&style=flat-square"/> <img src="https://shields.io/badge/Swift-F05138?logo=Swift&logoColor=FFF&style=flat-square"/> 

<br><br>
# 팀원 소개
| PO | CTO | Design  | iOS/PM | iOS(ML) | iOS(AR) |
| :-----: | :-----: | :-----:  | :-----: | :-----: | :-----: |
| <img src="https://user-images.githubusercontent.com/108044639/236135311-e81d1d0a-042f-4431-b54d-891138503cad.png" width=400px alt="Chad"/> | ![eugene](https://github.com/DeveloperAcademy-POSTECH/MC3_Team18_Ewook-IDLE/assets/108044639/ff559e51-56b1-45da-85cf-a849e8e307a1) | ![gen](https://github.com/DeveloperAcademy-POSTECH/MC3_Team18_Ewook-IDLE/assets/108044639/4d0b770a-3b1f-484a-8b0c-2ac4994d5334) | ![MK](https://github.com/DeveloperAcademy-POSTECH/MC3_Team18_Ewook-IDLE/assets/108044639/91c75bb5-78d6-405e-93a0-fd498363fdf2) |  ![Radin](https://github.com/DeveloperAcademy-POSTECH/MC3_Team18_Ewook-IDLE/assets/108044639/cb78aac2-4638-41d5-904a-cca14c0b5e91)  | ![Rubik](https://github.com/DeveloperAcademy-POSTECH/MC3_Team18_Ewook-IDLE/assets/108044639/2ff7dc23-4586-47f0-bca6-5c09141e176c) 
[Chad](https://github.com/chad0909) | [Eugene](https://github.com/dayjack)  | [Jen](https://github.com/jis00ya) | [MK](https://github.com/MK827) | [Radin](https://github.com/JINi0S) | [Rubik](https://github.com/RubiksCube33) |




## 협업 방법 & 깃 컨벤션

<details>
<summary>팀 협업용 깃허브 Forking Workflow 방식 협업 문서 </summary>
<div markdown="1">

### 1. 원본 레포를 fork하여 내 레포에 생성합니다.

### 2. 원하는 디렉토리에 git을 초기화 시켜줍니다.

```bash
git init
```

### 3. 원본(메인) 레포를 upstream으로 remote해줍니다.

```bash
git remote add upstream <원본(메인)레포 주소>
```

### 4. 로컬(나의) 레포를 origin으로 remote해줍니다.

```bash
git remote add origin <로컬(포크한 나의)레포 주소>
```

**작업을 진행할 시 upstream에서 pull을 받아오고, origin으로 push를 날려주어 pr을 진행합니다.**

→ 공동 작업물을 받아와서 내 개인 컴퓨터로 작업을 한 뒤, 공동 작업물에 합칠 수 있도록 진행하는 것

### 1. 이슈 템플릿에 맞춰 원본(메인) 레포에 이슈를 생성합니다.
- New issue를 클릭하여 이슈를 생성합니다.
- 이슈 한 개는 보통 뷰 하나 기준으로 만듭니다. (한 뷰에 주요 기능이 너무 많다면 쪼개기)
- Issue 제목 : **[라벨이름] (동사원형) (작업주제)**  
    - ex) [Feat] 생성 MainView / [Asset] 추가 color set
- 템플릿을 작성해줍니다. (이때 특히, Todo를 자세하게 적어주세요! 최대한 쪼개서!)

### 2. 이슈를 만들면 이슈 제목에 이슈 번호가 생성되는데, (ex) ~/#7)
로컬에 **타입/#이슈번호** 브랜치를 생성합니다.  
    - 브랜치 이름 : **타입/#이슈번호**
        - ex. Feat/#1

```bash
git branch Feat/#1    // 이슈번호1의 브랜치 생성
```

### 3. 해당 브랜치로 이동하여 작업을 합니다.

```bash
git switch Feat/#1    // 해당 브랜치로 변경
```

### 4. 작업이 끝난 뒤, add와 commit을 진행합니다.
 - 커밋 메세지 : **타입/#이슈번호: 커밋메세지**  
    - ex. Feat/#1: 추가 Question1

```bash
git add .    //작업 요소를 더해줌
git commit -m "Feat/#1: 추가 Question1"    //무엇을 했는지 메세지로 작성
```

### 5. 내가 작업을 하는 도중에 다른 사람이 작업을 진행하여 원본(메인)레포가 변경되어 있을 수도 있으니,
(확인을 위해) pull을 한 번  진행해준다.

```bash
git pull upstream develop    //원본(메인)레포의 파일을 불러온다.
```

### 6. 에러가 나지 않았다면, origin에서 작업한 내용을 push해준다.

```bash
git push -u origin <브랜치명>    //해당 브랜치를 올리고자 한다.
```

### 7. PR을 통해 코드 리뷰를 진행한 뒤, approve를 해준다면 merge를 한다.

### PR 요청 시

- Reviewers 자신 제외 모두 체크
- Assignees 자기 자신 추가
- Labels 이슈와 동일하게 추가
- 수정 필요 시 수정하기

### 8. 기본 브랜치로 돌아옵니다.

```bash
git switch develop
```

### 9. 1번부터 다시 진행을 하며 작업을 반복하면 됩니다.

</div>
</details>


##  깃 라벨 & 커밋 타입
<details>
<summary>깃 라벨 & 커밋 타입 </summary>
<div markdown="1">

| **제목** | **설명** |
| --- | --- |
| **Feat** | 기능 구현 이슈 |
| **Bug** | 버그 수정 |
| **Docs** | 문서 작성 이슈 |
| **Asset** | asset 파일(이미지, 아이콘 등) 추가 |
| **Renamed** | 리소스 이동, 이름 변경 |
| **UI** | UI 관련 |
| **Delete** | 코드/파일 삭제 |
| **Text** | 텍스트 또는 리터럴 추가 및 수정 |
| **Comment** | 주석 추가/수정 |
| **Setting** | 프로젝트 세팅 |

### 브랜치 이름 구조

**타입/#숫자**

ex. Feat/#1

### ☁️ 커밋 구조

**타입/#이슈번호: 커밋메세지**

ex. Feat/#1: 추가 Question1

### ☁️ Issue

- 이슈 한 개는 보통 뷰 하나 기준으로 만듭니다. (한 뷰에 주요 기능이 너무 많다면 쪼개기)
- Issue 제목 : **[라벨이름] (동사원형) (작업주제)**
ex) [Feat] 생성 MainView / [Asset] 추가 color set
- 템플릿을 작성해줍니다. (이때 특히, Todo를 자세하게 적어주세요! 최대한 쪼개서!)
    - ex)
        - 팝업창
        - 8개의 카드와 글씨 (카드 안에는 일러스트)
        - 마지막 2개로 결승전 진행
        - 최종 결과 저장하기
- 완료 시 Issue를 닫습니다.
- Git Issue Template, PR → 양식 가져오기.

### ☁️ **Pull Reqeust**

- Issue 제목과 **동일하게** **제목을 작성한다.
- 템플릿 안에 내용을 채워준다. (아는 지식, 모르겠는 부분, 팀원들과 공유하고싶은 부분 모두 자세하게~)
- 이슈에서 쓴 라벨을 붙여준다.
- 본인 제외 한 명의 팀원의 Approve가 있어야 merge가 가능하다.
    - + 혼자서 할 수 있게끔 열어둠 (특정 상황에서만 사용)
- 리뷰어들은 단순히 approve를 한다기보다 코드 변화를 체크하고 네임컨벤션을 지키고 있는지를 확인한다.

</div>
</details>

## 개인정보처리방침

<details>
<summary> 개인정보처리방침 </summary>
<div markdown="1">
*< SounDrill >('*https://github.com/DeveloperAcademy-POSTECH/MC3_Team18_Ewook-IDLE*'이하 'SounDrill Website')*은(는) 「개인정보 보호법」 제30조에 따라 정보주체의 개인정보를 보호하고 이와 관련한 고충을 신속하고 원활하게 처리할 수 있도록 하기 위하여 다음과 같이 개인정보 처리방침을 수립·공개합니다.

**제1조(개인정보의 처리목적)< SounDrill >(이)가 개인정보 보호법 제32조에 따라 등록․공개하는 개인정보파일의 처리목적은 다음과 같습니다.**

- **1. 개인정보 파일명 : SounDrill 개인정보파일**
- 개인정보의 처리목적 : 소비자의 불만 또는 분쟁처리에 관한 기록
- 수집방법 : 홈페이지
- 보유근거 : 소비자의 불만 또는 분쟁처리에 관한 기록
- 보유기간 : 3년
- 관련법령 : 소비자의 불만 또는 분쟁처리에 관한 기록 : 3년

**제2조(처리하는 개인정보의 항목)**

① *< SounDrill >*은(는) 다음의 개인정보 항목을 처리하고 있습니다.

- 1< SounDrill 개인정보파일 >
- 필수항목 : 이름, 이메일
- 선택항목 :휴대전화번호

**제3조(개인정보의 파기절차 및 파기방법)**

*① < SounDrill > 은(는) 개인정보 보유기간의 경과, 처리목적 달성 등 개인정보가 불필요하게 되었을 때에는 지체없이 해당 개인정보를 파기합니다.② 정보주체로부터 동의받은 개인정보 보유기간이 경과하거나 처리목적이 달성되었음에도 불구하고 다른 법령에 따라 개인정보를 계속 보존하여야 하는 경우에는, 해당 개인정보를 별도의 데이터베이스(DB)로 옮기거나 보관장소를 달리하여 보존합니다.1. 법령 근거 :2. 보존하는 개인정보 항목 : 계좌정보, 거래날짜③ 개인정보 파기의 절차 및 방법은 다음과 같습니다.1. 파기절차< SounDrill > 은(는) 파기 사유가 발생한 개인정보를 선정하고, < SounDrill > 의 개인정보 보호책임자의 승인을 받아 개인정보를 파기합니다.*

*2. 파기방법*

*종이에 출력된 개인정보는 분쇄기로 분쇄하거나 소각을 통하여 파기합니다.*

*전자적 파일 형태의 정보는 기록을 재생할 수 없는 기술적 방법을 사용합니다*

***제4조(정보주체와 법정대리인의 권리·의무 및 그 행사방법에 관한 사항)**
① 정보주체는 SounDrill에 대해 언제든지 개인정보 열람·정정·삭제·처리정지 요구 등의 권리를 행사할 수 있습니다.
② 제1항에 따른 권리 행사는SounDrill에 대해 「개인정보 보호법」 시행령 제41조제1항에 따라 서면, 전자우편, 모사전송(FAX) 등을 통하여 하실 수 있으며 SounDrill은(는) 이에 대해 지체 없이 조치하겠습니다.
③ 제1항에 따른 권리 행사는 정보주체의 법정대리인이나 위임을 받은 자 등 대리인을 통하여 하실 수 있습니다.이 경우 “개인정보 처리 방법에 관한 고시(제2020-7호)” 별지 제11호 서식에 따른 위임장을 제출하셔야 합니다.
④ 개인정보 열람 및 처리정지 요구는 「개인정보 보호법」 제35조 제4항, 제37조 제2항에 의하여 정보주체의 권리가 제한 될 수 있습니다.
⑤ 개인정보의 정정 및 삭제 요구는 다른 법령에서 그 개인정보가 수집 대상으로 명시되어 있는 경우에는 그 삭제를 요구할 수 없습니다.
⑥ SounDrill은(는) 정보주체 권리에 따른 열람의 요구, 정정·삭제의 요구, 처리정지의 요구 시 열람 등 요구를 한 자가 본인이거나 정당한 대리인인지를 확인합니다.*

***제5조(개인정보의 안전성 확보조치에 관한 사항)< SounDrill >은(는) 개인정보의 안전성 확보를 위해 다음과 같은 조치를 취하고 있습니다.**
1. 내부관리계획의 수립 및 시행
개인정보의 안전한 처리를 위하여 내부관리계획을 수립하고 시행하고 있습니다.

2. 정기적인 자체 감사 실시
개인정보 취급 관련 안정성 확보를 위해 정기적(분기 1회)으로 자체 감사를 실시하고 있습니다.

3. 개인정보에 대한 접근 제한
개인정보를 처리하는 데이터베이스시스템에 대한 접근권한의 부여,변경,말소를 통하여 개인정보에 대한 접근통제를 위하여 필요한 조치를 하고 있으며 침입차단시스템을 이용하여 외부로부터의 무단 접근을 통제하고 있습니다.

4. 개인정보의 암호화
이용자의 개인정보는 비밀번호는 암호화 되어 저장 및 관리되고 있어, 본인만이 알 수 있으며 중요한 데이터는 파일 및 전송 데이터를 암호화 하거나 파일 잠금 기능을 사용하는 등의 별도 보안기능을 사용하고 있습니다.

**제6조(개인정보를 자동으로 수집하는 장치의 설치·운영 및 그 거부에 관한 사항)**
• SounDrill 은(는) 정보주체의 이용정보를 저장하고 수시로 불러오는 ‘쿠키(cookie)’를 사용하지 않습니다.*
• 현재 SounDrill은TrueDepth API를 사용하여 ‘TrueDepth 카메라’의 ‘페이스 블렌드쉐이프 정보’중 입모양을 수집하고, 이를 캐릭터와 동기화합니다. 단, 회사가 수집한 '페이스 블렌드쉐이프 정보'는 '차곡차곡 게임' 기능을 실행하기 위한 목적으로만 사용되며, 서버 또는 단말기에 저장되거나 제3자와 공유되지 않습니다.

***제7조 (개인정보 보호책임자에 관한 사항)**
① SounDrill 은(는) 개인정보 처리에 관한 업무를 총괄해서 책임지고, 개인정보 처리와 관련한 정보주체의 불만처리 및 피해구제 등을 위하여 아래와 같이 개인정보 보호책임자를 지정하고 있습니다.
• ▶ 개인정보 보호책임자
• 성명 :이기욱
• 직책 :공동창업자
• 직급 :공동창업자
• 연락처 : https://github.com/DeveloperAcademy-POSTECH/MC3_Team18_Ewook-IDLE
※ 개인정보 보호 담당부서로 연결됩니다.
• ▶ 개인정보 보호 담당부서
• 부서명 : 개인정보 보호 담당부서
• 담당자 : 이기욱
• 연락처 : https://github.com/DeveloperAcademy-POSTECH/MC3_Team18_Ewook-IDLE
② 정보주체께서는 SounDrill 의 서비스(또는 사업)을 이용하시면서 발생한 모든 개인정보 보호 관련 문의, 불만처리, 피해구제 등에 관한 사항을 개인정보 보호책임자 및 담당부서로 문의하실 수 있습니다. SounDrill 은(는) 정보주체의 문의에 대해 지체 없이 답변 및 처리해드릴 것입니다.*

***제8조(개인정보의 열람청구를 접수·처리하는 부서)정보주체는 ｢개인정보 보호법｣ 제35조에 따른 개인정보의 열람 청구를 아래의 부서에 할 수 있습니다.< SounDrill >은(는) 정보주체의 개인정보 열람청구가 신속하게 처리되도록 노력하겠습니다.**
• ▶ 개인정보 열람청구 접수·처리 부서
• 부서명 : SounDrill 상담처
• 담당자 : 이기욱
• 연락처 : https://github.com/DeveloperAcademy-POSTECH/MC3_Team18_Ewook-IDLE*

***제9조(정보주체의 권익침해에 대한 구제방법)**정보주체는 개인정보침해로 인한 구제를 받기 위하여 개인정보분쟁조정위원회, 한국인터넷진흥원 개인정보침해신고센터 등에 분쟁해결이나 상담 등을 신청할 수 있습니다. 이 밖에 기타 개인정보침해의 신고, 상담에 대하여는 아래의 기관에 문의하시기 바랍니다.1. 개인정보분쟁조정위원회 : (국번없이) 1833-6972 (www.kopico.go.kr)2. 개인정보침해신고센터 : (국번없이) 118 (privacy.kisa.or.kr)3. 대검찰청 : (국번없이) 1301 (www.spo.go.kr)4. 경찰청 : (국번없이) 182 (ecrm.cyber.go.kr)「개인정보보호법」제35조(개인정보의 열람), 제36조(개인정보의 정정·삭제), 제37조(개인정보의 처리정지 등)의 규정에 의한 요구에 대 하여 공공기관의 장이 행한 처분 또는 부작위로 인하여 권리 또는 이익의 침해를 받은 자는 행정심판법이 정하는 바에 따라 행정심판을 청구할 수 있습니다.※ 행정심판에 대해 자세한 사항은 중앙행정심판위원회(www.simpan.go.kr) 홈페이지를 참고하시기 바랍니다.*

***제10조(개인정보 처리방침 변경)**

① 이 개인정보처리방침은 2023년 8월 15부터 적용됩니다.

② 이전의 개인정보 처리방침은 아래에서 확인하실 수 있습니다.*

</div>
</details>
