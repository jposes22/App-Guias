







#import "LanguagePickerController.h"

#import "Idioma+CoreDataProperties.h"
@interface LanguagePickerController()

@property (nonatomic) NSInteger lastIndex;

@end

@implementation LanguagePickerController


- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow: (NSInteger)row inComponent:(NSInteger)component {
    _lastIndex = row;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return _lisLanguages.count;
}


-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return ((Idioma *)[_lisLanguages objectAtIndex:row]).nombreIdioma;
}

/*
-(NSString *)categoryAtIndex:(NSInteger)index{
    return [_lisLanguages objectAtIndex:index];
}

-(NSString *)lastCategoryName{
    return [[_lisLanguages objectAtIndex:_lastIndex] title];
}
-(NSString *) lastCodeCategory{
    return [_lisLanguages objectAtIndex:_lastIndex];
}
*/
@end
