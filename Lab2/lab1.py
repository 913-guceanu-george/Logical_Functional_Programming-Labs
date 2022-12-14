from sll import *


def inclusion_single(head: Node, e: int):
    """
        Checks if e is a memeber of the a list with the first elem as head.
    Args:
        head (Node): _description_
        e (int): _description_

    Returns:
        Bool: no need to explain
    """
    if head.content == e:
        return True
    if head.next is None:
        if head.content == e:
            return True
        return False
    return False or inclusion_single(head.next, e)


def inclusion(sll: List, head_of_list: Node):
    """
        Checks if the a list represented by it's head is included in the list that is a param.
    Args:
        sll (List): _description_
        head_of_list (Node): _description_

    Returns:
        Bool: no need to explain
    """
    if inclusion_single(sll.first, head_of_list.content) is False:
        return False
    if head_of_list.next is None:
        if inclusion_single(sll.first, head_of_list.content) is False:
            return False
        return True
    return False or inclusion(sll, head_of_list.next)


def removeRecursively(head: Node, e: int, sll: List):
    """
    We will have an empty list (sll) that will have all the elements
    from the initial list that are not e.    
    """
    if head is None:
        return
    if head.content != e:
        sll.add(sll.first, Node(head.content))
    removeRecursively(head.next, e, sll)


def __main__():
    sll = List()
    sll.add(sll.first, Node(1))
    sll.add(sll.first, Node(2))
    sll.add(sll.first, Node(3))

    # sll.display(sll.first)

    sll2 = List()
    sll2.add(sll2.first, Node(1))
    sll2.add(sll2.first, Node(2))
    sll2.add(sll2.first, Node(3))
    sll2.add(sll2.first, Node(4))
    sll2.add(sll2.first, Node(3))

    # Problem 13.a

    # Here we check if the second list is included in the first one, which is False
    # because it's got more elements, but the first one is included in the second one.

    print(inclusion(sll, sll2.first))
    print(inclusion(sll2, sll.first))

    # Problem 13.b
    # Does not really work
    sll_backup = List()
    removeRecursively(sll2.first, 3, sll_backup)
    sll_backup.display(sll_backup.first)


if __name__ == "__main__":
    __main__()
