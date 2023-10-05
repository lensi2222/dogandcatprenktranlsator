import 'package:dogandcatprenktranlsator/Model/catModel.dart';
import 'package:dogandcatprenktranlsator/Model/dogModel.dart';
import 'package:dogandcatprenktranlsator/Resources/AudioResources.dart';
import 'package:dogandcatprenktranlsator/Resources/StringResources.dart';

import '../Model/fakeCallModel.dart';
import '../Model/trainingModel.dart';
import '../model/languageModel.dart';
import 'ImagesResources.dart';

List<LanguageModel> languageList = [
  LanguageModel(
    title: "Hindi",
    images: hindiImg,
  ),
  LanguageModel(
    title: "English",
    images: englishImg,
  ),
  LanguageModel(
    title: "French",
    images: frenchImg,
  ),
  LanguageModel(
    title: "spanish",
    images: spanishImg,
  ),
  LanguageModel(
    title: "Portuguese",
    images: portuImg,
  ),
  LanguageModel(
    title: "Indonesian",
    images: indoImg,
  ),
  LanguageModel(
    title: "Korean",
    images: koreanImg,
  ),
  LanguageModel(
    title: "Japanese",
    images: japanImg,
  ),
  LanguageModel(
    title: "Russian",
    images: russiaImg,
  ),
  LanguageModel(
    title: "Lao",
    images: laoImg,
  ),
];

List<CatModel> catList = [
  CatModel(title: catWhatText, images: cat01Img, audio: cat01Audio),
  CatModel(title: catHuhText, images: cat02Img, audio: cat02Audio),
  CatModel(title: catFaintText, images: cat03Img, audio: cat03Audio),
  CatModel(title: catHungryText, images: cat04Img, audio: cat04Audio),
  CatModel(title: catHungryText, images: cat05Img, audio: cat05Audio),
  CatModel(title: catWowSoScaredText, images: cat06Img, audio: cat06Audio),
  CatModel(title: catHungryText, images: cat07Img, audio: cat07Audio),
  CatModel(title: catWhatADayText, images: cat08Img, audio: cat08Audio),
  CatModel(title: catCryingText, images: cat09Img, audio: cat09Audio),
  CatModel(title: catShiftyText, images: cat10Img, audio: cat10Audio),
  CatModel(title: catLaughingText, images: cat11Img, audio: cat11Audio),
  CatModel(title: catLoadingText, images: cat12Img, audio: cat12Audio),
  CatModel(title: catWhatText, images: cat13Img, audio: cat13Audio),
  CatModel(title: catMeooText, images: cat14Img, audio: cat14Audio),
  CatModel(title: catReallyText, images: cat15Img, audio: cat15Audio),
  CatModel(title: catThinkingText, images: cat16Img, audio: cat16Audio),
];
List<String> timerList = [
  '5',
  '30',
  '45',
  '60',
  '180',
  '300',
];
List<FakeCallModel> fakeCallList = [
  FakeCallModel(
      title: huskyFakeCallText, images: happyCatImg, video: videoHuskyVideo),
  FakeCallModel(
      title: huskyStripedFakeCallText,
      images: happyDogImg,
      video: videoHuskyStripVideo),
  FakeCallModel(
      title: britishShortHairCatFakeCallText,
      images: huskyImg,
      video: videoBritishVideo),
  FakeCallModel(
      title: goldenFakeCallText, images: goldenImg, video: videoGoldenVideo),
  FakeCallModel(
      title: catFakeCallText, images: fakeCatImg, video: videoCatVideo),
];
List<TrainingModel> trainingDogList = [
  TrainingModel(
    detailSubTite: subTitleDetailDogText,
    subTitle: subTitleDogFoodText,
    title: titleDogFoodText,
    images: foodImg,
  ),
  TrainingModel(
    detailSubTite: subTitleDogPraiseText,
    title: titleDogPraiseText,
    subTitle: subTitleDogPraiseText,
    images: praiseImg,
  ),
  TrainingModel(
    detailSubTite: subTitleDogBitingDetailText,
    title: titleDogBitingText,
    subTitle: subTitleDogBitingText,
    images: bitingImg,
  ),
  TrainingModel(
    detailSubTite: subTitleDogObedienceDetailText,
    title: titleDogObedienceText,
    subTitle: subTitleDogObedienceText,
    images: obediensImg,
  ),
  TrainingModel(
    detailSubTite: subTitleDogBarkingDetailText,
    title: titleDogBarkingText,
    subTitle: subTitleDogBarkingText,
    images: brakingImg,
  ),
];
List<TrainingModel> trainingCatList = [
  TrainingModel(
    detailSubTite: subTitleCatFeedingDetailText,
    subTitle: subTitleCatFeedingText,
    title: titleCatFeedingText,
    images: feedingImg,
  ),
  TrainingModel(
    detailSubTite: subTitleCatPlayingDetailCatText,
    title: titleCatPlayingCatText,
    subTitle: subTitleCatPlayingCatText,
    images: playingYourCatImg,
  ),
  TrainingModel(
      title: titleCatPettingCatText,
      subTitle: subTitleCatPettingCatText,
      images: pettingCatImg,
      detailSubTite: subTitleCatPettingDetailCatText),
  TrainingModel(
    detailSubTite: subTitleCatScratchingNeedsDetailText,
    title: titleCatScratchingNeedsText,
    subTitle: subTitleCatScratchingNeedsText,
    images: scarchingImg,
  ),
];
List<DogModel> dogDetailList = [
  DogModel(
    audio: dogAgreeAudio,
    title: agreeDogText,
    images: dogAgreeImg,
  ),
  DogModel(
    audio: dogAngryAudio,
    title: angryDogText,
    images: dogAngryImg,
  ),
  DogModel(
    audio: dogBeggingAudio,
    title: beggingDogText,
    images: dogBeggingImg,
  ),
  DogModel(
    audio: dogCryAudio,
    title: cryDogText,
    images: dogCryImg,
  ),
  DogModel(
    audio: dogCryLyingAudio,
    title: cryLyingDogText,
    images: dogCryLyingImg,
  ),
  DogModel(
    audio: dogDanceAudio,
    title: danceDogText,
    images: dogDancingImg,
  ),
  DogModel(
    audio: dogExhaustedAudio,
    title: exhaustedDogText,
    images: dogExhaustedImg,
  ),
  DogModel(
    audio: dogHandClapAudio,
    title: handClapDogText,
    images: dogHandClapImg,
  ),
  DogModel(
    audio: dogHappyAudio,
    title: happyDogText,
    images: dogHappyImg,
  ),
  DogModel(
    audio: dogHappyWalkAudio,
    title: happyWalkDogText,
    images: dogHappyWalkImg,
  ),
  DogModel(
    audio: dogHyAudio,
    title: hyDogText,
    images: dogHiImg,
  ),
  DogModel(
    audio: dogHyFenceAudio,
    title: hyFaceDogText,
    images: dogHiFenceImg,
  ),
  DogModel(
    audio: dogHungryAudio,
    title: hungryDogText,
    images: dogHungryImg,
  ),
  DogModel(
    audio: dogLieAudio,
    title: lieDogText,
    images: dogLieImg,
  ),
  DogModel(
    audio: dogLoveAudio,
    title: loveDogText,
    images: dogLoveImg,
  ),
  DogModel(
    audio: dogNoAudio,
    title: noDogText,
    images: dogNoImg,
  ),
  DogModel(
    audio: dogPetAudio,
    title: petDogText,
    images: dogPetImg,
  ),
  DogModel(
    audio: dogRaiseHandAudio,
    title: raiseHandDogText,
    images: dogRaiseHandImg,
  ),
  DogModel(
    audio: dogSadAudio,
    title: sadDogText,
    images: dogSadImg,
  ),
  DogModel(
    audio: dogScaredAudio,
    title: scaredDogText,
    images: dogScaredImg,
  ),
  DogModel(
    audio: dogScratchAudio,
    title: scratchDogText,
    images: dogScratchImg,
  ),
  DogModel(
    audio: dogShyAudio,
    title: shyDogText,
    images: dogShyImg,
  ),
  DogModel(
    audio: dogSoftAngryAudio,
    title: softBeggingDogText,
    images: dogSoftAngryImg,
  ),
  DogModel(
    audio: dogSoftBeggingAudio,
    title: softBeggingDogText,
    images: dogSoftBeggingImg,
  ),
  DogModel(
    audio: dogStartleAudio,
    title: startleDogText,
    images: dogStartleImg,
  ),
  DogModel(
    audio: dogSuperAngryAudio,
    title: superAngryDogText,
    images: dogSuperAngryImg,
  ),
  DogModel(
    audio: dogWonderAudio,
    title: wonderDogText,
    images: dogWonderImg,
  ),
  DogModel(
    audio: dogWowAudio,
    title: wowDogText,
    images: dogWowImg,
  ),
  DogModel(
    audio: dogYeahAudio,
    title: yeahDogText,
    images: dogYeahImg,
  ),
  DogModel(
    audio: dogYesAudio,
    title: yesDogText,
    images: dogYesImg,
  ),
];
