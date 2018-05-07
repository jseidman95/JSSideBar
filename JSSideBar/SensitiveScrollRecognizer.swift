//
//  SensitiveScrollRecognizer.swift
//  JSSidebar
//
//  Created by Jesse Seidman on 5/2/18.
//  Copyright © 2018 Jesse Seidman. All rights reserved.
//

import UIKit
import UIKit.UIGestureRecognizerSubclass

public class SensitiveScrollRecognizer: UIPanGestureRecognizer
{
  // handle initial touch
  public override func touchesBegan(_ touches: Set<UITouch>,
                                    with event: UIEvent)
  {
    super.touchesBegan(touches, with: event)
    
    if touches.count != 1 { state = .failed }
    else { self.state = .began }
  }
  
  public override func touchesMoved(_ touches: Set<UITouch>,
                                    with event: UIEvent)
  {
    super.touchesMoved(touches, with: event)

    self.state = .changed
  }
  
  // hand the end of touches
  public override func touchesEnded(_ touches: Set<UITouch>,
                                    with event: UIEvent)
  {
    super.touchesEnded(touches, with: event)
    
    self.state = .ended
  }
}
