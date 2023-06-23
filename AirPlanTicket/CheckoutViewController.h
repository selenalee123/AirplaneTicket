#import <UIKit/UIKit.h>

@interface CheckoutViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) NSArray *ticketList;
@property (strong, nonatomic) NSString *selectedTicketType;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
