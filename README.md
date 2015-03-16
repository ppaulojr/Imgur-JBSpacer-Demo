# Imgur-JBSpacer-Demo
Demo of JBSpacer loading Imgur

```
    JBSpacerOption *option = [JBSpacerOption optionWithItemSize:90.0f
                                                  minimumGutter:1.0f
                                            gutterToMarginRatio:1.0f
                                                  availableSize:320.0f //self.view.frame.size.width
                                       distributeExtraToMargins:YES];
    JBSpacer *spacer = [JBSpacer spacerWithOption:option];
    [spacer applySpacingToCollectionViewFlowLayout:self.flowLayout];
```
