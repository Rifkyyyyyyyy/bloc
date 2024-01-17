import 'package:bloc/bloc.dart';
import 'package:clients/src/utils/model/user_models.dart';
import 'package:meta/meta.dart';
import 'bloc.dart';

class BiodataBloc extends Bloc<BiodataEvent, BiodataState> {
  BiodataBloc() : super(BiodataInitial()) {
    on<CreateData>((event, emit) {
      @override
      Stream<BiodataState> mapEventToState(BiodataEvent event) async* {
        if (event is CreateData) {
          if (state is DataBiodata) {
            List<Biodata> updatedBiodataList =
                List.from((state as DataBiodata).biodata);
            Biodata newBiodata = Biodata(name: event.nama, age: event.umur);
            updatedBiodataList.add(newBiodata);
            yield DataBiodata(biodata: updatedBiodataList);
          }
        }
      }
    });
  }
}
