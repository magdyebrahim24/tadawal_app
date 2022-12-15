
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tadawal/core/utils/constants.dart';
import 'package:tadawal/core/widgets/loader_widget.dart';
import 'package:tadawal/features/product/domain/entity/product.dart';
import 'package:tadawal/features/product/presentation/cubit/product_cubit.dart';
import 'package:tadawal/features/product/presentation/cubit/product_state.dart';
import 'package:tadawal/features/product/presentation/widgets/text_form_field_widget.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({Key? key}) : super(key: key);

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  FocusNode productTittleFocusNode = FocusNode();
  FocusNode productDescriptionFocusNode = FocusNode();
  FocusNode productPriceFocusNode = FocusNode();

  TextEditingController productTittleTextEditingController =
  TextEditingController();

  TextEditingController descriptionTextEditingController =
  TextEditingController();

  TextEditingController priceTextEditingController = TextEditingController();

  _getProductFun(data) => BlocProvider.of<ProductCubit>(context).addProductEntity(addProductData: data).then((value) =>  Navigator.pop(context));

  void validateAndSave() {
    final FormState? form = _formKey.currentState;
    if (form!.validate()) {
      productTittleFocusNode.unfocus();
      productDescriptionFocusNode.unfocus();
      productPriceFocusNode.unfocus();
      Product product = Product(id: 2, tittle: productTittleTextEditingController.text.toString(),
          price: int.parse(priceTextEditingController.text),
          description: descriptionTextEditingController.text.toString(),
          image: 'saved imaged ----', category: 'Saved category ----- ');
      _getProductFun(product);

    } else {
      Constants.showToast(message: 'Some Thing Went Wrong ...\nPlease Try Again');
    }
  }

  String validateFun(String text) {
    return text.isEmpty ? "Field cant be empty" : '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_rounded)),
        centerTitle: true,
        title: const Text('Add Product'),
      ),
      body: BlocBuilder<ProductCubit, ProductStates>(
        builder: (context, state) {
          if(state is ProductIsLoadingState){
            return loadingWidget();
          } else{
            return Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    OutlineBorderTextFormField(
                      labelText: "Product Tittle",
                      myFocusNode: productTittleFocusNode,
                      tempTextEditingController: productTittleTextEditingController,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      autofocus: false,
                      checkOfErrorOnFocusChange: true,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(18),
                      ],
                      validation: (txt) => validateFun(txt),
                    ),
                    OutlineBorderTextFormField(
                      labelText: "Product Description",
                      myFocusNode: productDescriptionFocusNode,
                      tempTextEditingController: descriptionTextEditingController,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      autofocus: false,
                      checkOfErrorOnFocusChange: true,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(18),
                        // WhitelistingTextInputFormatter.digitsOnly
                      ],
                      validation: (txt) => validateFun(txt),
                    ),
                    OutlineBorderTextFormField(
                      labelText: "Product Price",
                      myFocusNode: productPriceFocusNode,
                      tempTextEditingController: priceTextEditingController,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      autofocus: false,
                      checkOfErrorOnFocusChange: true,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(4),
                      ],
                      validation: (txt) => validateFun(txt),
                    ),

                  ],
                ),
              ),
            );
          }

        },
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () => validateAndSave(),
        child: const Text(
          'Save',
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
