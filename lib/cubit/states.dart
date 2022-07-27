abstract class NewsStates {}

class CubitModeState extends NewsStates {}

class GetBusinessSuccess extends NewsStates {}

class GetBusinessfail extends NewsStates {}

class GetBusinessload extends NewsStates {}

class GetScienceSuccess extends NewsStates {}

class GetSciencefail extends NewsStates {}

class GetScienceload extends NewsStates {}

class GetSportsSuccess extends NewsStates {}

class GetSportsfail extends NewsStates {}

class GetSportsload extends NewsStates {}

class GetHealthSuccess extends NewsStates {}

class GetHealthfail extends NewsStates {}

class GetHealthload extends NewsStates {}

class GetTechnologySuccess extends NewsStates {}

class GetTechnologyfail extends NewsStates {}

class GetTechnologyload extends NewsStates {}

class GetSearchSuccess extends NewsStates {}

class GetSearchfail extends NewsStates {}

class GetSearchload extends NewsStates {}

class NewsInitialState extends NewsStates {}

class NewsBottomState extends NewsStates {}

class NewsGetDiscoveryLoadingState extends NewsStates {}

class NewsGetDiscoverySuccessState extends NewsStates {}

class NewsGetDiscoveryErrorState extends NewsStates
{
  final String error;
  NewsGetDiscoveryErrorState(this.error);
}
