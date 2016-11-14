






#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface LanguagePickerController :NSObject<UIPickerViewDataSource, UIPickerViewDelegate>

@property (nonatomic, strong) NSArray *lisLanguages;

-(NSString *)lastCategoryName;
-(NSString *) lastCodeCategory;
@end
