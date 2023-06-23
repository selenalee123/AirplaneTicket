#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UIPickerViewDataSource, UIPickerViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *ticketNumberTextField;
@property (weak, nonatomic) IBOutlet UIPickerView *ticketTypePickerView;
@property (weak, nonatomic) IBOutlet UITextView *ticketListTextView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
